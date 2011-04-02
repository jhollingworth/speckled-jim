module SpeckledJim
  module Broker
    class MessageReceiver < Cramp::Action
      on_start :receive_message
      def receive_message 
        data = request.env["rack.input"].read
        puts "Recieved:\n #{data}"
        message = HttpMessageParser.parse(data)
        halt(400, {}, "Invalid message") if message.nil?
        Router.route(message)
      end
    end
  end
end

