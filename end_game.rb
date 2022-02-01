module EndGame
  require './welcome'
  def print_end_game(player, _spacer, _print_board)
    puts "\nCongratulations, #{player.name}! You are the true TicTacToe master!"
    puts "\nAre you ready to test your skills again?"
    print "'[Y]es' to play again, '[Q]uit' to quit the game: "
    choice = gets.chomp.to_s.upcase
    make_choice(choice)
  end

  def make_choice(choice)
    case choice
    when 'YES', 'Y'
      welcome = Welcome.new
      welcome.welcome_screen
    when 'QUIT', 'Q'
      puts "\nYou have quit the game."
      exit
    else
      puts 'Invalid selection. Try again.'
      print "'[Y]es' to play again, '[Q]uit' to quit the game: "
      new_choice = gets.chomp.to_s.upcase
      make_choice(new_choice)
    end
  end
end
