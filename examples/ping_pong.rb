require File.dirname(__FILE__) + '/../lib/client'

puts "connecting"

bar_client = SpeckledJim::Client.new("bar")
bar_client.connect

foo_client = SpeckledJim::Client.new("foo")
foo_client.connect


puts "sending message"


foo_client.send("hello world", :to => "bar")

sleep(100)