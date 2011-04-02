module SpeckledJim 
  module Broker
    class Node
      def initialize(id)
        @id = id
      end
      
      def messages 
        ["hello", "world"]
      end
    end    
  end
end