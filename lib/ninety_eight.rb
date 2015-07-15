# Errors that happen in the game. If you get this error, everything is working fine.
class CardError < StandardError; end
def test(value, card) # Tests value of cards. Used by CPU.
	if card.num == "King"; value = 98
	else; value = $value + card.value
	end
	value = -100 if value > 98
end
def pause(p) # Shortcut for sleep and a newline.
	sleep(p)
	puts
end
class Card # The objects that are used in gameplay. Found in $deck.
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
class Hand # The gameplay happens here. Holds four cards and interacts with $deck.

	attr_reader :hand # The player's actual hand
	def initialize # Creates a new Hand. Takes four cards from $deck and shuffles $deck.
		$deck.shuffle!
		@hand = [$deck.shift, $deck.shift, $deck.shift, $deck.shift]
		$deck.shuffle!
	end
	def list # Lists the cards in attribute :hand.
		@hand.each {|card| print "\t#{card.num}"}
	end
	def play(selected_card) # Gameplay method
		legal = @hand.each_with_index do |card, index|
			if cards.num == selected_card.num 
				$deck.push @hand.delete_at(index)
				$deck.shuffle!
				@hand << $deck.shift
				$deck.shuffle!
				break true
			end
			false
		end
		raise CardError, "\aCard not Allowed\a" unless legal
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
