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
class Hand # The gameplay happens here. Holds four cards and interacts with $deck.
# The player's actual hand
	attr_reader :hand
	def initialize # Creates a new Hand. Takes four cards from $deck and shuffles $deck.
		Deck.shuffle!
		@hand = $deck.shift, $deck.shift, $deck.shift, $deck.shift
		Deck.shuffle!
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
				Deck.shuffle!
				draw, discard = $deck.shift, @hand[i]
				@hand.delete_at i
				Deck.push discard
				Deck.shuffle!
				@hand << draw
			end
			i += 1
		end
		raise CardError, "\aCard not Allowed\a" unless $legal
		if card.num == "King" then $value = 98
		else $value += card.value end
	end
end
Deck = Array.new
4.times do
	Deck.shuffle!
	Deck.push(Card.new("Ace"))
	Deck.shuffle!
	Deck.push(Card.new("King"))
	Deck.shuffle!
	Deck.push(Card.new("Queen"))
	Deck.shuffle!
	Deck.push(Card.new("Jack"))
	Deck.shuffle!
	(2..10).each do |num|
		Deck.push(Card.new(num))
		Deck.shuffle!
	end
end
