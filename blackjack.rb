#BlackJack game

cards_hash = { 'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, '10' => 10, '9' => 9,
'8' => 8, '7' => 7, '6' => 6, '5' => 5, '4' => 4, '3' => 3, '2' => 2, '1' => 1 }

deck_of_cards = []
cards_hash.each_key { |key| deck_of_cards.push(key) }

deck_of_cards = deck_of_cards * 4

deck_of_cards.shuffle!

your_hand = []
dealer_hand = []

def deal(input)
    return input[0]
end

your_hand.push(deal(deck_of_cards))
deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))


dealer_hand.push(deal(deck_of_cards))
deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))


your_hand.push(deal(deck_of_cards))
deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))


dealer_hand.push(deal(deck_of_cards))
deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))

print 'Your hand: '
your_hand.each { |x| print x, ' ' }

puts ''
sleep(1)
puts ''

print "Dealer's hand: "
dealer_hand.each { |x| print x, ' ' }

puts ''

def totals(input1, input2)
    @cards_hash = input2
    @the_hand = input1
    @values = @the_hand.map { |x| @cards_hash[@the_hand[@the_hand.index(x.to_s)]] }
    return @values.inject { |sum, n| sum + n }
end

puts ''

puts 'Hit or stay?'
ask = gets.chomp.downcase.to_s

until ask == 'stay'
    your_hand.push(deal(deck_of_cards))
    your_hand.each { |x| print x, ' ' }
    puts ''
    deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))
    totals_you = self.totals(your_hand, cards_hash)
    if totals_you > 21
        puts 'You lose'
        break
    end
    puts 'Hit or stay?'
    ask = gets.chomp.downcase.to_s
end

totals_dealer = self.totals(dealer_hand, cards_hash).to_i
totals_you = self.totals(your_hand, cards_hash).to_i

until totals_dealer > 16
    totals_dealer = self.totals(dealer_hand, cards_hash)
    dealer_hand.each { |x| print x, ' ' }
    puts ''
    dealer_hand.push(deal(deck_of_cards))
    deck_of_cards.delete_at(deck_of_cards.index(deal(deck_of_cards)))
end

if totals_dealer > 21
    puts 'Dealer busts! You win!'
elsif
    totals_dealer > totals_you
    puts 'You lose'
elsif
    totals_dealer == totals_you
    puts 'Push'
else
    puts 'You win!'
end
