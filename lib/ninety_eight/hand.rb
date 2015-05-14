require_relative "card"
module NinetyEight
class Hand # The gameplay happens here. Holds four cards and interacts with $deck.
# The player's actual hand
	attr_reader :hand
	def initialize # Creates a new Hand. Takes four cards from $deck and shuffles $deck.
		Deck.shuffle!
		@hand = Deck.shift, Deck.shift, Deck.shift, Deck.shift
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
end
