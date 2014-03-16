require "spec_helper"
require_relative '../../lib/hero'

describe Hero do
	describe "default attributes" do
	  it "has default strength equal to 3" do
	  	expect(subject.strength).to eql(3)
	  end
	  it "has default health equal to 10" do
	  	expect(subject.health).to eql(10)
	  end
	end
end