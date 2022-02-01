class Player
  require './board'
  attr_accessor :claimed_tiles
  attr_reader :name, :alliance

  def initialize(player_name, alliance)
    @name = player_name
    @alliance = alliance
    @claimed_tiles = []
    @won = false
  end

end
