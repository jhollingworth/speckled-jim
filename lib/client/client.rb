require 'eventmachine'
require File.dirname(__FILE__) + '/broker_stream'

module SpeckledJim
  class Client
    def initialize(id)
      @id = id
    end
    
    def connect()
      EventMachine::run {
        stream = SpeckledJim::BrokerStream.connect(
          :path => "/messages/#{@id}"
        )
        
        stream.each_item do |item|
           $stdout.print "#{item}\n"
           $stdout.flush
         end

         stream.on_error do |message|
           $stdout.print "error: #{message}\n"
           $stdout.flush
         end

         stream.on_reconnect do |timeout, retries|
           $stdout.print "reconnecting in: #{timeout} seconds\n"
           $stdout.flush
         end

         stream.on_max_reconnects do |timeout, retries|
           $stdout.print "Failed after #{retries} failed reconnects\n"
           $stdout.flush
         end

         trap('TERM') {  
           stream.stop
           EventMachine.stop if EventMachine.reactor_running? 
         }
      }
    end
  end
end