class Player
	attr_reader :health
	attr_accessor :name

	def initialize(name, health=50)
		@name = name.capitalize
		@health = health
	end
	
	def to_s()
		"I'm #{@name.capitalize} with a health of #{@health} and socre of #{score}."
	end

	def blam
		@health -= 10
	end

	def w00t
		@health += 15
		puts "Player got w00ted"
	end

	def score
		@health + @name.length
	end

	def name=(new_name)
		@name = new_name.capitalize
	end
end

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end