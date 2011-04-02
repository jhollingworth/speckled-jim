module SpeckledJim
  class Client
    def initialize(nid)
      @nid = nid
    end
    
    def connect()
      Thread.new do 
        EventMachine::run {
          stream = BrokerStream.connect(
            :path => "/messages/#{@nid}"
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
    
    def send(message, options = {})
      raise "Must specify the destination node" if !options.has_key?(:to)
      data = "to: node/#{options[:to]}\n\rfrom: node/#{@nid}\n\rbody: #{message}\n\r"
      HTTPClient.post "http://localhost:3000/messages", data
    end
  end
end