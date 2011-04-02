require 'em/buftok'

module SpeckledJim
  module Broker
    class HttpMessageParser
      
      class << self 
        def parse(request)
          message = Message.new
          BufferedTokenizer.new("\r").extract(request).each do |line|
            raise "Invalid message" if line.match(/([^:]*):(.*)/).nil?
            field = $1.downcase.strip.to_sym
            value = $2.strip
            case field
            
            when :to then 
              message.type, message.to = location(value)
          
            when :from then 
              type, id = location(value)
              message.from = Router.find(type, id)
          
            when :body then message.body = value
          
            else raise "Invalid message header #{field}"
          
            end
          end
          message
        end
      
        private 
      
        def location(value)
          raise "unknown destination #{value}" if value.match(/(node|feed)\/(.*)/).nil?
          return ($1.downcase == "node" ? :direct : :feed), $2.strip
        end
      end
    end
  end
end