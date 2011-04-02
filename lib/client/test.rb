require 'rubygems'
require 'uuid'
require File.dirname(__FILE__) + '/client'

client = SpeckledJim::Client.new(UUID.new.generate)
client.connect

Thread.join