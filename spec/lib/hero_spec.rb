require "spec_helper"
require_relative '../../lib/hero'

describe Hero do
	let(:hero) { Hero.new  }
	
	describe "default attributes" do
	  it "has default strength equal to 3" do
	  	expect(hero.strength).to eql(3)
	  end
	  it "has default health equal to 10" do
	  	expect(hero.health).to eql(10)
	  end
	  it "has default gold eq to 0" do
	  	expect(hero.gold).to eq(0)
	  end

	  it "has default exp eq to 0" do
	  	expect(hero.exp).to eq(0)
	  end

	  it "has default stealth eq to 1" do
	  	expect(hero.stealth).to eq(1)
	  end

	  it "is not fleeing by default" do
	  	expect(hero.fled?).to be_false
	  end
	end

	it "can be damaged" do
		hero.damage(3)
		hero.damage(2)
		expect(hero.health).to eq(5)
	end

	it "gains gold" do
		hero.gain_gold(5)
		hero.gain_gold(3)
		expect(hero.gold).to eq(8)
	end

	it "gains exp" do
		hero.gain_exp(2)
		hero.gain_exp(8)
		expect(hero.exp).to eq(10)
	end

	it "can be initialized with custom strength" do
		hero =  Hero.new strength: 12
		expect(hero.strength).to eq(12)
	end

	it "can be initialized with custom health" do
		hero =  Hero.new health: 5
		expect(hero.health).to eq(5)
	end

	describe "attack action" do
		let(:attack_action) { double("attack_action") }
		let(:hero) { Hero.new actions: { attack: attack_action }  }

		it "has attack action" do
			expect(hero.actions[:attack]).to eq(attack_action)
		end

		it "activates attack action" do
			monster = double("monster")
			attack_action.should_receive(:activate)
			hero.activate_action :attack, monster
		end
	
	end

	describe "flee state" do
	  it "flees from battle" do
	  	hero.flee
	  	expect(hero.fled?).to be_true
	  end
	end

end