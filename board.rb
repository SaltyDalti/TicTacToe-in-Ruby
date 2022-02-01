class Board
  require './tile'
  require './player'
  require './end_game'
  require './win'
  require './draw_game'

  include WIN
  include EndGame
  include DrawGame

  BOARD_SIZE = 9

  private

  def initialize(player1, player2)
    @players = [player1, player2]
    @player_tracker = 0

    @tiles_container = []

    create_board
    print_board
    turn(current_player)
  end

  # creates an array of 9 tile objects, each with its own ID
  def create_board
    (0...BOARD_SIZE).each { |x| @tiles_container.push(Tile.new(x)) }
  end

  # prints the board
  def print_board
    puts "| #{@tiles_container[0].show} | #{@tiles_container[1].show} | #{@tiles_container[2].show} |"
    puts '- - - - - - -'
    puts "| #{@tiles_container[3].show} | #{@tiles_container[4].show} | #{@tiles_container[5].show} |"
    puts '- - - - - - -'
    puts "| #{@tiles_container[6].show} | #{@tiles_container[7].show} | #{@tiles_container[8].show} |"
  end

  # called in turn
  def find_legal_moves
    # checks the tiles on the board for alliance, only open tiles accepted
    @legal_moves = @tiles_container.reject { |tile| tile.alliance == 'X' || tile.alliance == 'O' }
  end

  # returns the current player
  def current_player
    @players[@player_tracker]
  end

  # called to 'clear the screen' in console. Formatting
  def spacer
    5.times { puts '' }
  end

  # changes the player's turn with math
  def flip_board
    @player_tracker = (@player_tracker - 1).abs
    spacer
    print_board
    turn(current_player)
  end

  # called in turn
  def make_move(move, player)
    @tiles_container[move - 1].alliance = player.alliance # sets the selected tile to the player's alliance
    player.claimed_tiles.push(@tiles_container[move - 1]) # adds the tile to the player's tile array
    print_end_game(player, spacer, print_board) if won?(player) # checks if the player won with selection
  end

  # called each turn
  def turn(player)
    find_legal_moves
    turn_complete = false # boolean to end turn
    print_draw_game if find_legal_moves.empty? # calls a draw when the board is full

    until turn_complete
      # get player tile choice
      puts "\n#{player.name}: Choose your space. (1-9)"
      selection = gets.chomp.to_i

      unless selection < 10 && selection.positive? # input validation
        print "Sorry, that's not an option."
        next
      end
      if @legal_moves.include?(@tiles_container[selection - 1]) # make sure move is legal
        turn_complete = true
        make_move(selection, player) # make the move
        flip_board # next player's turn
      else
        print 'That spot is taken! Try a different space.'
      end
    end
  end
end
