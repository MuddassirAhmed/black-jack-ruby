# frozen_string_literal: true

require_relative 'class_card'

# Deck class
class Deck
  VALUES = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'].freeze
  SUITS = %w[clubs spades hearts diamonds].freeze

  def initialize
    @cards = []
    build_deck
  end

  def build_deck
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

  def deal_a_card
    random_index = rand(@cards.length)
    card = @cards[random_index]
    @cards.delete_at(random_index)
    card # returns card
  end

  def show_deck
    @cards.each(&:show_card)
  end
end
