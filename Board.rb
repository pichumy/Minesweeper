require_relative 'Tile'
require 'byebug'

class Board

  attr_reader :grid

  def initialize(grid = Array.new(9) {Array.new(9,nil)} )
    @grid = grid
  end

  def populate

     length = @grid.length
     number_bombs = length * 2
     placed = 0
     until placed == number_bombs
       pos = [rand(length), rand(length)]
       if self[pos] == nil
         self[pos] = Tile.new(:b)
         placed += 1
       end
     end
     fill
  end

  def fill
    grid.each_with_index do |row,idx1|
      row.each_with_index do |tile, idx2|
        pos = [idx1,idx2]
        self[pos] = Tile.new(count_bombs(pos)) if self[pos] == nil
      end
    end
  end

  def count_bombs(pos)
    row, col = pos
    counter = 0
    (-1..1).each do |row_diff|
      (-1..1).each do |col_diff|
        new_pos = [row+row_diff, col_diff + col]
        if valid_pos?(new_pos)  && self[new_pos].class == Tile
          counter += 1 if self[new_pos].bomb
        end
      end
    end
    counter
  end

  def valid_pos?(pos)
    return true if pos.all? {|loc| loc >= 0 && loc < @grid.length - 1}
    false
  end

  def [](pos)
    row, col = pos
    # byebug
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def reveal(pos_nest)
    pos_nest.each do |pos|
      
    end

  end

  def check_surrounding()
    (-1..1).each do |row_diff|
      (-1..1).each do |col_diff|
        new_pos = [row+row_diff, col_diff + col]
        if valid_pos?(new_pos)  && self[new_pos].class == Tile
          counter += 1 if self[new_pos].bomb
        end
      end
    end
  end

  def render
    @grid.each do |row|
      row.each do |tile|
        print [tile.to_s]
        print ' '
      end
      print "\n"
    end
  end

end
