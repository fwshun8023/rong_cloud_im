module RongCloudIM
  module Service
    API_HOST                = "http://api.cn.ronghub.com"
    ACTION_USER_TOKEN       = "/user/getToken"
    ACTION_GROUP_CREATE     = "/group/create"
    ACTION_GROUP_DISMISS    = "/group/dismiss"
    ACTION_GROUP_REFRESH    = "/group/refresh"
    ACTION_GROUP_user_query = "/group/user/query"


    class << self

      def user_get_token(params)
        data = {
          userId: params[:user_id],
          name: params[:name],
          portraitUri: params[:portrait_uri]
        }

        get_response(data, ACTION_USER_TOKEN)
      end

      def group_create(params)
        data = {
          userId: params[:user_id],
          groupId: params[:group_id],
          groupName: params[:group_name]
        }

        get_response(data, ACTION_GROUP_CREATE)
      end

      def group_dismiss(params)
        data = {
          userId: params[:user_id],
          groupId: params[:group_id],
        }

        get_response(data, ACTION_GROUP_DISMISS)
      end

      def group_refresh(params)
        data = {
          groupId: params[:group_id],
          groupName: params[:group_name]
        }

        get_response(data, ACTION_GROUP_REFRESH)
      end

      def group_user_query(params)
        data = {
          groupId: params[:group_id]
        }

        get_response(data, ACTION_GROUP_user_query)
      end

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