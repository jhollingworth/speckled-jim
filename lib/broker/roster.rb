require 'node'

module SpeckledJim
  module Broker
    class Roster
      def self.add(id)
        unless nodes.has_key?(id)
          puts "Added node #{id} to the roster"
          nodes[id] = Node.new(id)
        end
        find(id)
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