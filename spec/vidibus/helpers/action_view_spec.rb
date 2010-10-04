require "spec_helper"
require "action_view"

describe ActionView::Base do
  describe "#number_to_duration" do
    it "should return 00:24 for 24 seconds" do
      subject.number_to_duration(24).should eql("00:24")
    end

    it "should return 00:00:24 for 24 seconds if :hours option is true" do
      subject.number_to_duration(24, :hours => true).should eql("00:00:24")
    end

    it "should return 01:00:54 for 3654 seconds" do
      subject.number_to_duration(3654, :hours => true).should eql("01:00:54")
    end

    it "should return 01:00:55 for 3654.5 seconds" do
      subject.number_to_duration(3654.5, :hours => true).should eql("01:00:55")
    end

    it "should return 60:54 for 3654 seconds if :hours option is false" do
      subject.number_to_duration(3654, :hours => false).should eql("60:54")
    end
    
    it "should accept string input" do
      subject.number_to_duration("0.7").should eql("00:01")
    end
  end
end
