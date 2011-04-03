module SpeckledJim
  module Broker
    class MessageStream < Cramp::Action
      on_start :authenticate
      keep_connection_alive
      periodic_timer :send_messages, :every => 1
            
      def authenticate
        @node = Roster.add(params[:id])
        render "connected: true\r\n"
      end
      
      def send_messages
        while !(message = @node.next_message).nil?
          puts "sending message to #{@node.nid}"
          render message.body.to_s + "\r\n"
        end

        if @node.disconnect?
          puts "Closing #{@node.nid} message stream"
          finish
        end
      end
    end
  end
end

