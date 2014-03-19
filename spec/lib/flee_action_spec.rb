require "spec_helper"
require_relative "../../lib/flee_action"

describe FleeAction do
	let(:dicepool) { double("dicepool") }
	let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 5, flee: nil) }
	let(:action) { FleeAction.new hero, dicepool }
	let(:monster) { double("monster", toughness: 2, kill: nil, damage: nil, notice: 3) }

	it "responds to activate message" do
		expect(action).to respond_to(:activate)
	end

	it "has an owner" do
		expect(action.owner).to eq(hero)
	end

	describe "activate" do
	  it "makes stealth check against target toughness" do
	  	dicepool.should_receive(:skill_check).with(hero.stealth, monster.notice)
	  	action.activate(monster)	
	  end

	end

	describe "effect" do
	  context "success" do
	  	it "sends flee message to owner" do
	  		dicepool.stub(:skill_check).and_return(true)
	  		hero.should_receive(:flee)
	  		action.activate(monster)
	  	end
	  end
	  context "failure" do
	  	it "deals damage to the owner" do
	  		dicepool.stub(:skill_check).and_return(false)
	  		hero.should_receive(:damage).with(monster.damage)
	  		action.activate(monster)
	  	end
	  end
	end
end