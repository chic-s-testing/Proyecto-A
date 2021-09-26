# frozen_string_literal: true

require_relative 'cell'
require_relative 'board_creation'

# Model for Minesweeper
class GameModel
  def initialize
    @board_instance = Board.new
    @board = @board_instance.bomb_board
    print_board
  end

  def print_board
    @board.each do |row|
      row.each do |cell|
        print(cell.value)
      end
      print("\n")
    end
  end
end

GameModel.new
