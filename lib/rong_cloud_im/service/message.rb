module RongCloudIM
  class Message < Service
    ACTION_MESSAGE_HISTORY   = "/message/history"

    class << self
      def history(params)
        data = {
          date: params[:date]
        }

        get_response(data, ACTION_MESSAGE_HISTORY)
      end
      
    end
  end
end