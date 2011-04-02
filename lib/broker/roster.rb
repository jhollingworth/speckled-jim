require 'node'

module SpeckledJim
  module Broker
    class Roster
      def self.add(id)
        raise "Node already connected" if nodes.has_key?(id)
        puts "Registered node #{id}"
        nodes[id] = Node.new(id)
      end
      
      def self.find(id)
        nodes[id]
      end
      
      def self.clear
        @@nodes = {}
      end
      
      private 
      
      def self.nodes 
        @@nodes = {} if !defined?(@@nodes)
        @@nodes
      end
    end
  end
end