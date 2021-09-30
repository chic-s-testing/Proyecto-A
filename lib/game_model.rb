# frozen_string_literal: true

require_relative 'cell'
require_relative 'board_creation'
require_relative 'game_view'

# Model for Minesweeper
class GameModel
  attr_reader :board, :number_not_bombs, :board_instance

  def initialize(bomb_seed = 'random')
    @board_instance = Board.new(bomb_seed)
    @board = @board_instance.board
    @number_not_bombs = @board_instance.not_bombs_cells
    @number_discovered = 0
  end

  def check_cell_bomb(pos_i, pos_j)
    cell = @board[pos_i][pos_j]
    return true if cell.value == -1

    false
  end

  def winner
    @number_discovered == @number_not_bombs
  end

  def mark_uncover(row, col)
    @number_discovered += 1 unless @board[row][col].visible
    @board[row][col].uncover_cell
  end

  def mark_add_flag(row, col)
    @board[row][col].put_flag
  end

  def mark_remove_flag(row, col)
    @board[row][col].delete_flag
  end
end
