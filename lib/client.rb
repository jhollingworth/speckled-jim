Bundler.require(:default) if defined?(Bundler)
require 'rubygems'
require 'eventmachine'
require 'httpclient'

$: << File.dirname(__FILE__) + '/client'

Dir[File.dirname(__FILE__) + '/client/**.rb'].each { |f| require f }