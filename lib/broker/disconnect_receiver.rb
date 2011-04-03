module SpeckledJim
  module Broker
    class DisconnectReceiver < Cramp::Action
      on_start :receive_disconnect
      def receive_disconnect
        node = Roster.find(params[:id])
        node.disconnect = true
        puts "Node #{node.nid} is disconnecting"

        finish
      end
    end
  end
end