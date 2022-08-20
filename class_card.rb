# frozen_string_literal: true

# card class
class Card
  attr_accessor :value, :suit, :score

  def initialize(value, suit)
    @value = value
    @suit = suit
    @score = calculate_score(value)
  end

  def show_card
    puts "#{value}-#{suit} (#{score})"
  end

  private
  def calculate_score(value)
    if value.is_a? Integer
      value
    elsif value == 'A'
      11
    else # J, Q, K
      10
    end
  end
end
