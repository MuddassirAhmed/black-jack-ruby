# frozen_string_literal: true

# player class
class Player
  attr_accessor :name, :hand, :bank, :total, :bet

  def initialize(name, bank_roll)
    @name = name
    @hand = []
    @bank_roll = bank_roll
    @total = 0
    @bet = 0
  end

  def add_card_in_hand(card)
    card.score = 1 if card.score == 11 && total > 11
    @total += card.score
    hand << card
  end

  def show_hand
    hand.each(&:show_card)
    puts "score: #{total}"
  end

  def intrdouce
    puts "I am #{name}, I have $#{bank_roll} left."
  end
end
