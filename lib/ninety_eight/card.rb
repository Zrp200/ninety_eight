require "card_deck/card"
module NinetyEight
  class Card < CardDeck::Card # The objects that are used in gameplay. Found in $deck.
	Num = {
		K: "King",
		Q: "Queen",
		A: "Ace",
		J: "Jack"
	}
	def initialize(num=CardDeck::Card::Num.sample, suit=CardDeck::Card::Suit.sample) # Creates a new Card
		primary_num = Num[Array(num.upcase.to_sym).first]
		super
		@num = primary_num unless primary_num.nil?
	end
	def value # Returns the Card's value based on its :num attribute.
		case @num
			when "Ace" then 1
			when 2..9 then @num
			when 10 then -10
			when "King" then 98 # Sets value to 98
		else 0 end
	end
end
