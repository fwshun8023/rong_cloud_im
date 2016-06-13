module RongCloudIM
  class Group < Service
    ACTION_GROUP_CREATE     = "/group/create"
    ACTION_GROUP_DISMISS    = "/group/dismiss"
    ACTION_GROUP_REFRESH    = "/group/refresh"
    ACTION_GROUP_USER_QUERY = "/group/user/query"
    
    class << self
      def create(params)
        data = {
          userId: params[:user_id],
          groupId: params[:group_id],
          groupName: params[:group_name]
        }

        get_response(data, ACTION_GROUP_CREATE)
      end

      def dismiss(params)
        data = {
          userId: params[:user_id],
          groupId: params[:group_id],
        }

        get_response(data, ACTION_GROUP_DISMISS)
      end

      def refresh(params)
        data = {
          groupId: params[:group_id],
          groupName: params[:group_name]
        }

        get_response(data, ACTION_GROUP_REFRESH)
      end

      def user_query(params)
        data = {
          groupId: params[:group_id]
        }

        get_response(data, ACTION_GROUP_USER_QUERY)
      end
    end
  end
end