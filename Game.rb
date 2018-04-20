require_relative 'Board'
require 'byebug'
class Minesweeper

  def initialize(board = Board.new)
    @board = board
    @over = false
  end

  def run
    unless @over || won?

    end
  end

  def get_pos
    begin
      puts("Enter a location")
      pos = parse_pos(gets.chomp)
      raise unless @board.valid_pos?(pos)
    rescue
      puts("Invalid position! Did you forget a comma?")
      retry
    end
    pos
  end

  def play_turn
    @board.render
    pos = get_pos
    @board.reveal([pos])
    game_over?(pos)

  end

  def parse_pos(string)
    string.split(",").map(&:to_i)
  end

  def won?

  end

  def game_over?(pos)
    @over = true if @board[pos].bomb
  end
end
