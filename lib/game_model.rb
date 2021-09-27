# frozen_string_literal: true

require_relative 'cell'
require_relative 'board_creation'

# Model for Minesweeper
class GameModel
  attr_reader :board, :number_not_bombs, :board_instance

  def initialize
    @board_instance = Board.new
    @board = @board_instance.bomb_board
    @number_not_bombs = @board_instance.not_bombs_cells
    @number_discovered = 0
  end

  def check_cell_bomb(pos_i, pos_j)
    cell = @board[pos_i][pos_j]
    return true if cell.value == -1

    false
  end
end
