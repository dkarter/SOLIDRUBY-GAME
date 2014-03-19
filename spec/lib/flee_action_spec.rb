require "spec_helper"
require_relative "../../lib/flee_action"

describe FleeAction do
	let(:dicepool) { double("dicepool") }
	let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 5) }
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
	  	
	  end
	  context "failure" do
	  	
	  end
	end
end