module DrawGame
  require './end_game'
  include EndGame

  def print_draw_game
    puts "\nYou have reached a draw! Want another chance to see who is the real winner?"
    print "'[Y]es' to play again, '[Q]uit' to quit the game: "
    choice = gets.chomp.to_s.upcase
    make_choice(choice)
  end
end
