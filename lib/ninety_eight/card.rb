module NinetyEight
  class Card # The objects that are used in gameplay. Found in $deck.
# The number on the card
	attr_reader :num
	@@num = {
		King: "King",
		K: "King",
		Queen: "Queen",
		Q: "Queen",
		Ace: "Ace", 
		A: "Ace",
		Jack: "Jack",
		J: "Jack"
	}
	def initialize(card) # Creates a new Card
		@num = @@num.fetch(card.capitalize.to_sym) {card}
	end
end
	def value # Returns the Card's value based on its :num attribute.
		return case @num
			when "Ace" then 1
			when 2..9 then @num
			when 10 then -10
			when "King" then 98 #Sets value to 98
		else 0 end
	end
end
