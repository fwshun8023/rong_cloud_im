module RongCloudIM
  class Message < Service
    ACTION_MESSAGE_HISTORY   = "/message/history"
    ACTION_PUBLISH = {
      private: "/message/private/publish",
      group: "/message/group/publish"
    }

    class << self
      def history(params)
        data = {
          date: params[:date]
        }

        get_response(data, ACTION_MESSAGE_HISTORY)
      end
      
      def publish(type, params)
        data = {
          fromUserId: params[:from_user_id],
          objectName: params[:object_name],
          content: params[:content],
          pushContent: params[:push_content] || "",
          pushData: params[:push_data] || "",
          isPersisted: params[:is_persisted] || 1,
          isCounted: params[:is_counted] || 1
        }
        case type
        when :private
          data[:toUserId] = params[:to_user_id]
          data[:count] = params[:count] || 0
          data[:verifyBlacklist ] = params[:verify_blacklist] || 0
        when :group
          data[:toGroupId] = params[:to_group_id]
        end
        get_response(data, ACTION_PUBLISH[type])
      end

    end
  end
end