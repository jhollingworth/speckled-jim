module SpeckledJim
  module Broker
    class NodeOfflineException < Exception
      attr_reader :from, :to
      def initialize(from, to)
        puts "Node #{to} is offline"
        @from = from 
        @to = to
      end
    end 
  end
end