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
    @total += card.score
    hand << card
    hand.each do |c|
      if c.score == 11 && total > 21
        c.score = 1
        @total -= 10
      end
    end
  end

  def show_hand
    hand.each(&:show_card)
    puts "#{name}\'s Score: #{total}"
    puts
  end

  def intrdouce
    puts "I am #{name}, I have $#{bank_roll} left."
  end
end
