require 'rubygems'
require 'cramp'
require 'usher'
require File.dirname(__FILE__) + '/roster'

module SpeckledJim
  module Broker
    class MessageStream < Cramp::Action
      on_start :authenticate
      keep_connection_alive
      periodic_timer :send_messages, :every => 1
            
      def authenticate
        @node = Roster.register(params[:id])
      end
      
      def send_messages
        @node.messages.each do |m| 
          render m + "\r\n"
        end
      end
    end
  end
end

routes = Usher::Interface.for(:rack) do
  add('/messages/:id').to(SpeckledJim::Broker::MessageStream)
end

Rack::Handler::Thin.run routes, :Port => 3000
