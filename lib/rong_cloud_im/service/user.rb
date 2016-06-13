module RongCloudIM
  class User < Service
    ACTION_USER_TOKEN   = "/user/getToken"
    ACTION_USER_REFRESH = "/user/refresh"

    class << self
      def get_token(params)
        data = {
          userId: params[:user_id],
          name: params[:name],
          portraitUri: params[:portrait_uri]
        }

        get_response(data, ACTION_USER_TOKEN)
      end

      def refresh(params)
        data = {
          userId: params[:user_id],
          name: params[:name],
          portraitUri: params[:portrait_uri]
        }

        get_response(data, ACTION_USER_TOKEN)
      end
    end
  end
end