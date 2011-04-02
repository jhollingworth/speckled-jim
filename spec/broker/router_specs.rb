require 'spec_helper'

module SpeckledJim
  module Broker
    describe Router do 
      describe "#route" do
        before(:all) do 
          @direct_message = Message.new(:to => "foo", :from => "bar", :type => :direct)
        end
        
        it "should route the direct message to the correct node" do
          node = Roster.add("foo")
          
          Router.route(@direct_message)
          
          node.next_message.should == @direct_message
        end
        
        it "should raise a NodeOfflineException if the node is not in the roster" do
          lambda { Router.route(@direct_message) }.should raise_error(NodeOfflineException) 
        end
        
        after(:each) do
          Roster.clear 
        end
      end
    end
  end
end