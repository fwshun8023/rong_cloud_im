module RongCloudIM
  module Service
    API_HOST = "http://api.cn.ronghub.com"
    ACTION_USER_TOKEN = "/user/getToken" 

    class << self

      def sign(data)
        OpenSSL::Digest::SHA1.new(data).to_s
      end

      def headers
        nonce = Random.new_seed.to_s
        timestamp = Time.now.to_i.to_s
        app_secret = RongCloudIM.app_secret || ""
        signature = sign(app_secret + nonce + timestamp)
        {
          'RC-App-Key': RongCloudIM.app_key || "",
          'RC-Nonce': nonce,
          'RC-Timestamp': timestamp,
          'RC-Signature': signature
        }
      end

      def response_type
        RongCloudIM.response_type || 'json'
      end

      def user_get_token(params)
        data = {
          userId: params[:user_id],
          name: params[:name],
          portraitUri: params[:portrait_uri]
        }

        get_response(data, ACTION_USER_TOKEN)
      end

      def get_response(data, path)
        uri = URI(API_HOST + path + "." + response_type)

        http = Net::HTTP.new(uri.host, uri.port)

        request = Net::HTTP::Post.new(uri.path)
        
        headers.each do |key, value|
          request.add_field(key, value)
        end
        
        request.set_form_data(data)
        response = http.request(request)

        result response.body
      end

      def result body
        begin
          JSON.parse body
        rescue => e
          {
            code: 502,
            msg: "内容解析错误",
            detail: e.to_s
          }
        end
      end

    end
  end
end