module SpeckledJim
  module Broker
    class NodeOfflineException < Exception
      attr_reader :to
      def initialize(to)
        puts "Node #{to} is offline"
        @to = to
      end
    end 
  end
end