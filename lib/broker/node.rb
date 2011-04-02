require 'thread'

module SpeckledJim 
  module Broker
    class Node
      attr_reader :nid
      
      def initialize(nid)
        @nid = nid
        @messages = Queue.new
      end
      
      def next_message
        @messages.empty? ? nil :  @messages.pop
      end
      
      def send_message message
        @messages << message
      end
    end    
  end
end