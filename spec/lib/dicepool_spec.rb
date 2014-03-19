require "spec_helper"
require_relative "../../lib/dicepool"

describe Dicepool do
  describe "skill_check" do
  	let(:dicepool) { Dicepool.new }
    it "returns true if number of successes is more than difficulty" do
    	dicepool.stub(:roll_die).and_return(5)
    	expect(dicepool.skill_check(3,2)).to be_true
    end
    it "return false if number of successes is less than difficulty" do
		dicepool.stub(:roll_die).and_return(2)
		expect(dicepool.skill_check(3,2)).to be_false    	
    end
  end
end