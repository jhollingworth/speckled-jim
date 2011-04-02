module SpeckledJim
  module Broker
    class Router 
      def self.route(message)
        destination = find(message.type, message.to)
        
        raise "unable to find destination for message #{message.mid}" if destination.nil?
        
        destination.send_message(message)
      end
      
      def self.find(type, id)
        case type 
        when :direct
          node = Roster.find(id)
          raise NodeOfflineException.new(id) if node.nil?
          node
        else raise "Unknown message type"
        end
      end
    end
  end
end