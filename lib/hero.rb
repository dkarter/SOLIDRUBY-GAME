class Hero
	attr_reader :strength, :health, :actions, :exp, :gold, :stealth

	def initialize(attr = {})
		@strength = attr.fetch(:strength, 3)
		@health = attr.fetch(:health, 10)
		@stealth = attr.fetch(:stealth, 1)

		@actions = attr.fetch(:actions, {})

		@gold = 0
		@exp = 0

		@fled = false
	end

	def activate_action(action_name, target)
		actions[action_name].activate(target)
	end

	def damage(hit)
		@health -= hit
	end

	def gain_gold(amount = 1)
		@gold += amount
	end

	def gain_exp(amount = 1)
		@exp += amount
	end

	def fled?
		@fled
	end

	def flee
		@fled = true
	end
end
