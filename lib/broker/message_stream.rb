module SpeckledJim
  module Broker
    class MessageStream < Cramp::Action
      on_start :authenticate
      keep_connection_alive
      periodic_timer :send_messages, :every => 1
            
      def authenticate
        @node = Roster.add(params[:id])
      end
      
      def send_messages
        message = @node.next_message 
        unless message.nil?
          puts "sending message:"
          puts pp message
          render message.body.to_s + "\r\n"
        end
      end
    end
  end
end

