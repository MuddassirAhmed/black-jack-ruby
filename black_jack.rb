# frozen_string_literal: true

require_relative 'player'
require_relative 'deck'

# Game class
class BlackJack
  VALID_OPTIONS = %w[h s].freeze
  def initialize(player_name)
    @user = Player.new(player_name, 1000)
    @computer = Player.new('Dealer', 100_000)
    @deck = Deck.new
  end

  def play_game
    puts("Welcome to the Balck Jack #{@user.name}")
    deal_initial_cards
    deal_cards_for_user unless @user.total == 21
    deal_cards_for_computer unless @computer.total == 21 || @user.total > 21
    show_hands
    check_winner
  end

  private

  def deal_initial_cards
    @computer.add_card_in_hand(@deck.deal_a_card)
    @computer.add_card_in_hand(@deck.deal_a_card)

    puts "=== #{@computer.name}\'s Hand ==="
    @computer.hand[0].show_card

    @user.add_card_in_hand(@deck.deal_a_card)
    @user.add_card_in_hand(@deck.deal_a_card)

    puts
    puts "=== #{@user.name}\'s Hand ==="
    @user.show_hand
  end

  def deal_cards_for_user
    puts '~~~~ Your Turn ~~~~'
    while @user.total < 21
      puts 'Do you want to hit(h) or stand(s)?'
      hit_or_stand = gets.chomp.downcase

      until VALID_OPTIONS.include?(hit_or_stand)
        puts 'Please enter valid option ("h" or "s")'
        hit_or_stand = gets.chomp.downcase
      end

      break unless hit_or_stand == VALID_OPTIONS[0]

      card = @deck.deal_a_card
      @user.add_card_in_hand(card)
      card.show_card
      puts "Score: #{@user.total}"
    end
  end

  def deal_cards_for_computer
    puts "~~~~ #{@computer.name}\'s Turn ~~~~"
    while @computer.total < 17
      card = @deck.deal_a_card
      @computer.add_card_in_hand(card)
      card.show_card
    end
  end

  def show_hands
    puts "xXx #{@user.name} Busted xXx" if @user.total > 21
    puts "=== #{@user.name}\'s Hand ==="
    @user.show_hand
    puts "xXx #{@computer.name} Busted xXx" if @computer.total > 21
    puts "=== #{@computer.name}\'s Hand ==="
    @computer.show_hand
  end

  def check_winner
    if @user.total == @computer.total && @computer.total <= 21
      puts "==> TIE <=="
    elsif @user.total > 21
      puts 'It\'s a BLACK JACK' if @computer.total == 21
      puts "!!! #{@computer.name} WON !!!"
    elsif @user.total > @computer.total || @computer.total > 21
      puts 'It\'s a BLACK JACK' if @user.total == 21
      puts "==> #{@user.name} WON <=="
    else
      puts 'It\'s a BLACK JACK' if @computer.total == 21
      puts "!!! #{@computer.name} WON !!!"
    end
  end
end
