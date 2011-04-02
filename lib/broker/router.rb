module SpeckledJim
  module Broker
    class Router 
      def self.route(message)
        case message.type
        when :direct then
          node = Roster.find(message.to)
          raise NodeOfflineException.new(message.from, message.to) if node.nil?
                
          puts "Routing direct message #{message.mid} from #{message.from} to #{message.to}"
          node.send_message(message)
        else
          raise "Unknown message type"
        end
      end
    end
  end
end