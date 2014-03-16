class Hero
	attr_reader :strength, :health, :actions

	def initialize(attr = {})
		@strength = attr.fetch(:strength, 3)
		@health = attr.fetch(:health, 10)
		@dicepool = attr.fetch(:dicepool)
		@actions = attr.fetch(:actions, {})
	end

	def attack(monster)
		@dicepool.skill_check(strength, monster.toughness)
	end
end
