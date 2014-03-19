class Monster
	attr_reader :toughness, :damage, :notice, :gold, :exp
	def initialize(attr = {})
		@toughness = attr.fetch(:toughness, 0)
		@damage = attr.fetch(:damage, 0)
		@notice = attr.fetch(:notice, 0)
		@gold = attr.fetch(:gold, 0)
		@exp = attr.fetch(:exp, 0)

		@dead = false
	end

	def dead?
		@dead
	end

	def kill
		@dead = true
	end
end