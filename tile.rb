class Tile
  attr_accessor :alliance
  attr_reader :tile_id, :top, :middle, :bottom, :left, :center, :right, :diag, :slant

  @alliance = ' '

  def initialize(tile_id)
    @tile_id = tile_id
    @tile_group = []
    make_columns
    make_rows
    make_diags
  end

  # prints the tile's alliance when called
  def show
    case alliance
    when 'X'
      'X'
    when 'O'
      'O'
    else
      ' '
    end
  end

  # tells win module if the tile is in a certain row
  def make_rows
    @top = true if @tile_id < 3
    @middle = true if @tile_id >= 3 && @tile_id <= 5
    @bottom = true if @tile_id >= 6 && @tile_id <= 8
  end

  # tells the win module if the tile is in a certain column
  def make_columns
    @left = true if (@tile_id % 3).zero?
    @center = true if @tile_id % 3 == 1
    @right = true if @tile_id % 3 == 2
  end

  # tells the win module if the tile is in a diagonal
  def make_diags
    @diag = true if (@tile_id % 4).zero?
    @slant = true if (@tile_id % 2).zero? && @tile_id != 0 && @tile_id != 8
  end

end
