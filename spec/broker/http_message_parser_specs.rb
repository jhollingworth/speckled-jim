require 'spec_helper'

module SpeckledJim
  module Broker
    describe HttpMessageParser do
      
      describe "#parse" do 
        subject { "from: node/foo\n\rto: node/bar\n\rbody: { 'message': 'hello world' }\n\r" }
        
        it "should be able to parse a valid http message" do
          foo = Roster.add("foo")
          
          message = HttpMessageParser.parse(subject)
          
          message.type.should == :direct
          message.to.should == "bar"
          message.from.should == foo
          message.body.should == "{ 'message': 'hello world' }"
        end
      end
    end
  end
end