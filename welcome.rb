class Welcome
  require './board'
  require './player'

  # prints the welcome screen
  def welcome_screen
    5.times { puts '' }
    puts 'Welcome to TicTacToe!'
    puts '      --~~~--        '
    2.times { puts '' }
    puts 'Press enter to begin.'
    gets.chomp
    player_create
  end

  # gets player information and instantiates two player objects
  def player_create
    print 'Enter Player 1 Name: '
    player1_name = gets.chomp
    player1 = Player.new(player1_name, 'X')

    print 'Enter Player 2 Name: '
    player2_name = gets.chomp
    player2 = Player.new(player2_name, 'O')

    puts "\n\n#{player1.name} and #{player2.name}, let's see who is truly the TicTacToe master..."
    puts 'Press enter to begin the battle.'
    gets.chomp
    game_start(player1, player2)
  end

  # takes the players and passes them to the board
  def game_start(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(@player1, @player2)
  end
end
