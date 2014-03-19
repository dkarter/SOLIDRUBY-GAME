require "spec_helper"
require_relative "../../lib/monster"


describe Monster do
	
	let(:monster) { Monster.new toughness: 2, damage: 4, notice: 5, gold: 12, exp: 3 }
	it "has toughness" do
		expect(monster.toughness).to eq(2)
	end	  
	it "has damage" do
		expect(monster.damage).to eq(4)
	end
	it "has notice" do
		expect(monster.notice).to eq(5)
	end
	it "has gold" do
		expect(monster.gold).to eq(12)
	end
	it "has exp" do
		expect(monster.exp).to eq(3)
	end

	it "is alive on initialization" do
		expect(monster.dead?).to be_false
	end

	it "can be killed" do
		monster.kill
		expect(monster.dead?).to be_true
	end
end