require 'uuid'
module SpeckledJim
  module Broker
    class Message 
      attr_accessor :from, :to, :body, :type, :mid
      
      def initialize(options = {})
        @mid = UUID.new.generate
        options.each do |property, value|
          instance_variable_set(("@" + property.to_s).to_sym, value)
        end
      end
    end
  end
end