# frozen_string_literal: true

require_relative 'class_player'
require_relative 'class_deck'

# Game class
class BlackJack
  def initialize(player_name)
    @user = Player.new(player_name, 1000)
    @computer = Player.new('Computer', 100_000)
    @deck = Deck.new
  end

  def play_game
    puts("Welcome to the Balck Jack #{@user.name}")

    @computer.add_card_in_hand(@deck.deal_a_card)
    @computer.add_card_in_hand(@deck.deal_a_card)

    @computer.show_hand

    @user.add_card_in_hand(@deck.deal_a_card)
    @user.add_card_in_hand(@deck.deal_a_card)

    @user.show_hand

  end
end
