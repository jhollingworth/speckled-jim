require File.dirname(__FILE__) + '/../lib/client'

puts "connecting"

pong = SpeckledJim::Client.new("pong")
pong.connect

puts "sending ping"
pong.send("ping", :to => "ping")


sleep(100)