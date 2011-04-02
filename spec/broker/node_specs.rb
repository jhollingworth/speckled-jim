require 'spec_helper'

module SpeckledJim
  module Broker
    describe Node do 
      describe "#send_message" do
        it "add the message to the message queue" do
          node = Node.new("foo")
          message = Message.new(
            :to => "foo", 
            :from => "bar",
            :body => "bibble"
          )

          node.send_message(message)

          node.next_message.should == message
          node.next_message.should == nil
        end
      end
    end
  end
end