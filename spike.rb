hero = Hero.new 10, 3
monster = Monster.new 2, 4

until hero.attack(monster) || hero.dead?
	puts "You missed. Monster dealt #{monster.damage} "
end