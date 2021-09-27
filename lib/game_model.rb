# frozen_string_literal: true

require_relative 'cell'
require_relative 'board_creation'

# Model for Minesweeper
class GameModel
  attr_reader :board, :number_not_bombs

  def initialize
    @board_instance = Board.new
    @board = @board_instance.bomb_board
    @number_not_bombs = @board_instance.not_bombs_cells
    @number_discovered = 0
    print_board
  end
end

GameModel.new
