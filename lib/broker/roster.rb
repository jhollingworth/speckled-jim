require File.dirname(__FILE__) + '/node'
module SpeckledJim
  module Broker
    class Roster
      def self.register(id)
        raise "Node already connected" if nodes.has_key?(id)
        puts "Registered node #{id}"
        nodes[id] = Node.new(id)
      end
      
      private 
      
      def self.nodes 
        @@nodes = {} if !defined?(@@nodes)
        @@nodes
      end
    end
  end
end