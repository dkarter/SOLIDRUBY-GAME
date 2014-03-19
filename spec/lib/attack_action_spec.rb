require "spec_helper"
require_relative "../../lib/attack_action"

describe AttackAction do
	let(:dicepool) { double("dicepool") }
	let(:hero) { double("hero", strength: 3) }
	let(:action) { AttackAction.new hero, dicepool }
	it "responds to activate message" do
		expect(action).to respond_to(:activate)
	end

	it "has an owner" do
		expect(action.owner).to eq(hero)
	end

	describe "activate" do
	  it "makes strength check against target toughness" do
	  	monster = double("monster", toughness: 2)
	  	dicepool.should_receive(:skill_check).with(hero.strength, monster.toughness)
	  	action.activate(monster)	
	  end

	end
end