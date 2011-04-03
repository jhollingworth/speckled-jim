module SpeckledJim
  module Broker
    class MessageReceiver < Cramp::Action
      on_start :receive_message
      def receive_message
        data = request.env["rack.input"].read
        message = HttpMessageParser.parse(data)
        halt(400, {}, "Invalid message") if message.nil?
        begin
          Router.route(message)
        rescue NodeOfflineException => e
          halt(404, {}, "The node #{e.to} is offline")
        rescue Exception => e
          puts "Server error: #{e}"
          halt(500, {}, "A server error occurred")
        end
        finish
      end
    end
  end
end

