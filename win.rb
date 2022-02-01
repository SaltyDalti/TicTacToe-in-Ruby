module WIN

  def won?(player)
    bool = false
    bool = true if check_rows?(player) || check_columns?(player) || check_diags?(player)
    bool
  end

  def check_rows?(player)
    bool = false
    top = player.claimed_tiles.select { |tile| tile.top == true }
    middle = player.claimed_tiles.select { |tile| tile.middle == true }
    bottom = player.claimed_tiles.select { |tile| tile.bottom == true }

    rows = [top, middle, bottom]
    rows.each { |row| bool = true if row.size == 3}

    bool
  end

  def check_columns?(player)
    bool = false
    left = player.claimed_tiles.select { |tile| tile.left == true }
    center = player.claimed_tiles.select { |tile| tile.center == true }
    right = player.claimed_tiles.select { |tile| tile.right == true }

    columns = [left, center, right]
    columns.each { |column| bool = true if column.size == 3 }

    bool
  end

  def check_diags?(player)
    bool = false
    diag = player.claimed_tiles.select { |tile| tile.diag == true }
    slant = player.claimed_tiles.select { |tile| tile.slant == true }

    diags = [diag, slant]
    diags.each { |diagonal| bool = true if diagonal.size == 3 }

    bool
  end
end
