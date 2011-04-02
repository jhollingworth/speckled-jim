Bundler.require(:default) if defined?(Bundler)

require 'rubygems'
require 'cramp'
require 'pp'

$: << File.dirname(__FILE__) + '/broker'

Dir[File.dirname(__FILE__) + '/broker/**.rb'].each { |f| require f }