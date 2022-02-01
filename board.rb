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

    draw_board
    print_board
    turn(current_player)
  end

  def draw_board
    (0...BOARD_SIZE).each { |x| @tiles_container.push(Tile.new(x)) }
  end

  def print_board
    puts "| #{@tiles_container[0].show} | #{@tiles_container[1].show} | #{@tiles_container[2].show} |"
    puts '- - - - - - -'
    puts "| #{@tiles_container[3].show} | #{@tiles_container[4].show} | #{@tiles_container[5].show} |"
    puts '- - - - - - -'
    puts "| #{@tiles_container[6].show} | #{@tiles_container[7].show} | #{@tiles_container[8].show} |"
  end

  def find_legal_moves
    @legal_moves = @tiles_container.reject { |tile| tile.alliance == 'X' || tile.alliance == 'O' }
  end

  def current_player
    @players[@player_tracker]
  end

  def spacer
    5.times { puts '' }
  end

  def flip_board
    @player_tracker = (@player_tracker - 1).abs
    spacer
    print_board
    turn(current_player)
  end

  def make_move(move, player)
    @tiles_container[move - 1].alliance = player.alliance
    player.claimed_tiles.push(@tiles_container[move - 1])
    print_end_game(player, spacer, print_board) if won?(player)
  end

  def turn(player)
    find_legal_moves
    turn_complete = false
    print_draw_game if find_legal_moves.empty?

    until turn_complete # todo make method out of this
      puts "\n#{player.name}: Choose your space. (1-9)"
      selection = gets.chomp.to_i

      unless selection < 10 && selection.positive?
        print "Sorry, that's not an option."
        next
      end
      if @legal_moves.include?(@tiles_container[selection - 1])
        turn_complete = true
        make_move(selection, player)
        flip_board
      else
        print 'That spot is taken! Try a different space.'
      end
    end
  end
end
