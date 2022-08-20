# frozen_string_literal: true

require_relative 'black_jack'

print 'Enter your name: '
player_name = gets.chomp

new_game = BlackJack.new(player_name)
new_game.play_game
