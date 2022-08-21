# frozen_string_literal: true

# player class
class Player
  attr_accessor :name, :hand, :starting_amount, :bank_roll, :total

  def initialize(name, bank_roll)
    @name = name
    @hand = []
    @starting_amount = bank_roll
    @bank_roll = bank_roll
    @total = 0
  end

  def is_bet_amount_available?(bet)
    bet <= bank_roll
  end

  def won_amount(bet)
    @bank_roll += bet
  end

  def lost_amount(bet)
    @bank_roll -= bet if bet <= bank_roll
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

  def clear_hand
    hand.clear
    @total = 0
  end

  def intrdouce
    puts "I am #{name}, I have $#{bank_roll} left."
  end
end
