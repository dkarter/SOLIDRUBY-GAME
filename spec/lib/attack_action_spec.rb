require "spec_helper"
require_relative "../../lib/attack_action"

describe AttackAction do
	let(:dicepool) { double("dicepool") }
	let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
	let(:action) { AttackAction.new hero, dicepool }
	let(:monster) { double("monster", toughness: 2, kill: nil, damage: nil) }

	it "responds to activate message" do
		expect(action).to respond_to(:activate)
	end

	it "has an owner" do
		expect(action.owner).to eq(hero)
	end

	describe "activate" do
	  it "makes strength check against target toughness" do
	  	dicepool.should_receive(:skill_check).with(hero.strength, monster.toughness)
	  	action.activate(monster)	
	  end

	end

	describe "effect" do
	  context 'success' do
	  	before(:each) do
	  	  dicepool.stub(:skill_check).and_return(true)
	  	end
	  	after(:each) do
	  		action.activate(monster)  
	  	end
	  	it "kills monster" do
	  		monster.should_receive(:kill)
	  	end
	  	it "rewards owner with exp" do
	  		hero.should_receive(:gain_exp)
	  	end

	  	it "rewards owner with gold" do
	  		hero.should_receive(:gain_gold)
	  	end
	  end
	  context 'failure' do
	  	it "damages owner" do
	  		dicepool.stub(:skill_check).and_return(false)
	  		hero.should_receive(:damage).with(monster.damage)
	  		action.activate(monster)
	  	end
	  end
	end
end