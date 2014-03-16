require "spec_helper"
require_relative '../../lib/hero'

describe Hero do
	describe "default attributes" do
		let(:hero) { Hero.new }

	  it "has default strength equal to 3" do
	  	expect(subject.strength).to eql(3)
	  end
	  it "has default health equal to 10" do
	  	expect(subject.health).to eql(10)
	  end
	end

	it "can be initialized with custom strength" do
		hero =  Hero.new strength: 12
		expect(hero.strength).to eq(12)
	end

	it "can be initialized with custom health" do
		hero =  Hero.new health: 5
		expect(hero.health).to eq(5)
	end
end