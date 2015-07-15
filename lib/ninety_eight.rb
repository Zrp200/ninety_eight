require "card_deck"
include CardDeck
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
class Card # The objects that are used in gameplay.
	alias_method :old_initialize, :initialize # Adding to previously defined initialization method
	@@num = {K: "King", Q: "Queen",  A: "Ace", J: "Jack"} # Abbrevations
	def initialize(num=Num.sample, suit=Suit.sample)
		num = @@num.fetch num.capitalize.to_sym if num.is_a? String && num.length == 1
		num = num.to_i if num.to_i.to_s == num.to_s
		old_initialize(num, suit)
	end
	def value # Returns the Card's value based on its :num attribute.
		case @num
			when "Ace" then 1
			when 2..9 then @num
			when 10 then -10
			when "King" then 98 #Sets value to 98
		else 0
		end
	end
end
# A subclass of Card that can imitate its superclass. Used to make user input Card-like.
class Hand # The gameplay happens here. Holds four cards and interacts with $deck.

	attr_reader :hand # The player's actual hand
	def initialize # Creates a new Hand. Takes four cards from $deck and shuffles $deck.
		$deck.cards.shuffle!
		@hand = [$deck.cards.shift, $deck.cards.shift, $deck.cards.shift, $deck.cards.shift]
		$deck.shuffle!
	end
	def list # Lists the cards in attribute :hand.
		@hand.each {|card| print "\t#{card.num}"}
	end
	def play(selected_card) # Gameplay method
		legal = @hand.each_with_index do |card, index|
			if cards.num == selected_card.num 
				$deck.cards.push @hand.delete_at(index)
				$deck.cards.shuffle!
				@hand << $deck.cards.shift
				$deck.cards.shuffle!
				break true
			end
			false
		end
		raise CardError, "\aCard not Allowed\a" unless legal
		if card.num == "King" then $value = 98
		else $value += card.value end
	end
end
$deck = Deck.new
=begin
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
=end
