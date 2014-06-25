class CardError < StandardError; end
class Card
	attr_reader :num
	def initialize(card); @num = card; end
	def value
		case self.num
			when "Ace" then return 1
			when 2..9 then return self.num
			when 10 then return -10
			when "King" then return 98 #Sets value to 98
		else; return 0
		end
	end
end
class UserCard < Card
	@@num = {King: "King", K: "King", Queen: "Queen", Q: "Queen", Ace: "Ace", A: "Ace", Jack: "Jack", J: "Jack"}
	def initialize(card)
		@@num.default = card.to_i
		@num = @@num[card.capitalize.to_sym]
	end
end
class Hand
	attr_reader :hand
	def initialize
		$deck.shuffle!
		@hand = [$deck.shift, $deck.shift, $deck.shift, $deck.shift]
		$deck.shuffle!
	end
	def list; @hand.each {|card| print "\t#{card.num}"}; end
	def play(card)
		$legal, i, done = false, 0, false
		for cards in @hand
			if cards.num == card.num and done == false
				done = true
				$legal = true
				$deck.shuffle!
				draw = $deck.shift
				discard = @hand[i]
				@hand.delete_at(i)
				$deck.push(discard)
				$deck.shuffle!
				@hand.push(draw)
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