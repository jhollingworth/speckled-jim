require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new do |t| 
  t.pattern = './spec/**/*_specs.rb'
end


desc "Run broker specs"
namespace :broker do 

  RSpec::Core::RakeTask.new(:spec) do |t| 
    t.pattern = './spec/broker/*_specs.rb'
  end
end