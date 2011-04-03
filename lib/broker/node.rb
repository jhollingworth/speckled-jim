require 'thread'

module SpeckledJim 
  module Broker
    class Node
      attr_reader :nid

      def initialize(nid)
        @nid = nid
        @messages = Queue.new
        @disconnect = false
      end
      
      def next_message
        @messages.empty? ? nil :  @messages.pop
      end

      def disconnect=(disconnect)
        @disconnect = disconnect
      end

      def disconnect?
        @disconnect
      end

      def send_message message
        @messages << message
      end
    end    
  end
end