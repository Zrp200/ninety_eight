# Errors that happen in the game. If you get this error, everything is working fine.
class CardError < StandardError; end
class Card # The objects that are used in gameplay. Found in _$deck_.
# The number on the card
	attr_reader :num
# Creates a new card.
	def initialize(card); @num = card; end
	def value # Returns the Card's value based on its :num attribute.
		case self.num
			when "Ace" then return 1
			when 2..9 then return self.num
			when 10 then return -10
			when "King" then return 98 #Sets value to 98
		else; return 0
		end
	end
end
# A subclass of Card that can imitate its superclass. Used to make user input Card-like.
class UserCard < Card
# Abbrevations
	@@num = {King: "King", K: "King", Queen: "Queen", Q: "Queen", Ace: "Ace", A: "Ace", Jack: "Jack", J: "Jack"}
	def initialize(card) # Creates a new UserCard. Looks at abbrevations and modifies user input so it is Card-like.
		@@num.default = card.to_i
		@num = @@num[card.capitalize.to_sym]
	end
end
class Hand # The gameplay happens here. Holds four cards and interacts with _$deck_.
# The player's actual hand
	attr_reader :hand
	def initialize # Creates a new Hand. Takes four cards from _$deck_ and shuffles _$deck_.
		$deck.shuffle!
		@hand = [$deck.shift, $deck.shift, $deck.shift, $deck.shift]
		$deck.shuffle!
	end
# Lists the cards in attribute :hand.
	def list; @hand.each {|card| print "\t#{card.num}"}; end
	def play(card) # Gameplay method
		$legal, i, done = false, 0, false
		for cards in @hand
			if cards.num == card.num and done == false
				done = true
				$legal = true
				$deck.shuffle!
				draw = $deck.shift
				discard = @hand[i]
				@hand.delete_at i
				$deck.push discard
				$deck.shuffle!
				@hand << draw
			end
			i += 1
		end
		raise CardError, "\aCard not Allowed\a" unless $legal
		if card.num == "King"; $value = 98
		else; $value += card.value
		end
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
	$deck.push(Card.new(10))
	$deck.shuffle!
	$deck.push(Card.new(9))
	$deck.shuffle!
	$deck.push(Card.new(8))
	$deck.shuffle!
	$deck.push(Card.new(7))
	$deck.shuffle!
	$deck.push(Card.new(6))
	$deck.shuffle!
	$deck.push(Card.new(5))
	$deck.shuffle!
	$deck.push(Card.new(4))
	$deck.shuffle!
	$deck.push(Card.new(3))
	$deck.shuffle!
	$deck.push(Card.new(2))
	$deck.shuffle!
end
