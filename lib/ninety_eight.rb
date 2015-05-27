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
