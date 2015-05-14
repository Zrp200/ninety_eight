module NinetyEight
# Errors that happen in the game. If you get this error, everything is working fine.
class CardError < StandardError; end
def test(value, card) # Tests value of cards. Used by CPU.
	if card.num == "King" then value = 98
	else value = $value + card.value end
	value = -Float::INFINITY if value > 98
end
def pause(p) # Shortcut for sleep and a newline.
	sleep p
	puts
end

# A subclass of Card that can imitate its superclass. Used to make user input Card-like.
class UserCard < Card
# Abbrevations
	@@num = {King: "King", K: "King", Queen: "Queen", Q: "Queen", Ace: "Ace", A: "Ace", Jack: "Jack", J: "Jack"}
	def initialize(card) # Creates a new UserCard. Looks at abbrevations and modifies user input so it is Card-like.
		@@num.default = card.to_i
		@num = @@num.fetch card.capitalize.to_sym
	end
end
class Hand # The gameplay happens here. Holds four cards and interacts with $deck.
# The player's actual hand
	attr_reader :hand
	def initialize # Creates a new Hand. Takes four cards from $deck and shuffles $deck.
		$deck.shuffle!
		@hand = $deck.shift, $deck.shift, $deck.shift, $deck.shift
		$deck.shuffle!
	end
# Lists the cards in attribute :hand.
	def list
		@hand.each {|card| print "\t#{card.num}"}
	end
	def play(card) # Gameplay method
		$legal, i, done = false, 0, false
		for cards in @hand
			if cards.num == card.num and done == false
				done, $legal = true
				$deck.shuffle!
				draw, discard = $deck.shift, @hand[i]
				@hand.delete_at i
				$deck.push discard
				$deck.shuffle!
				@hand << draw
			end
			i += 1
		end
		raise CardError, "\aCard not Allowed\a" unless $legal
		if card.num == "King" then $value = 98
		else $value += card.value end
	end
end
$deck = Array.new
4.times do
	$deck.shuffle!
	$deck.push(Card.new("Ace"))
	$deck.shuffle!
	$deck.push(Card.new("King"))
	$deck.shuffle!
	$deck.push(Card.new("Queen"))
	$deck.shuffle!
	$deck.push(Card.new("Jack"))
	$deck.shuffle!
	(2..10).each do |num|
		$deck.push(Card.new(num))
		$deck.shuffle!
	end
end
