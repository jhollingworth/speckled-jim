module SpeckledJim
  module Broker
    class PingReceiver < Cramp::Action
      on_start :receive_ping
      def receive_ping
        render "pong\n\r"
        finish
      end
    end
  end
end