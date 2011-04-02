require 'spec_helper'

module SpeckledJim
  module Broker
    describe Roster do 
      describe "#find" do
        it "should return the node if registered" do
          Roster.add("test")
          node = Roster.find("test")
          node.should_not == nil
          node.nid.should == "test"
        end
        
        it "should return nil if the node is not registered" do
          Roster.find("wibble").should == nil
        end
        
        after(:each) do
          Roster.clear 
        end
      end
    end
  end
end