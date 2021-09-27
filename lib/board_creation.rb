# frozen_string_literal: true

require_relative 'cell'
require_relative 'board/cell_values'

# board creation class
class Board
  attr_reader :board, :bomb_board, :not_bombs_cells, :bombs

  def initialize
    @board = create_board
    @not_bombs_cells = 100 - @bombs
  end

  def create_board
    coordinate_sample
    create_bomb_board
    put_bombs
    create_cells
    @bomb_board
  end

  def coordinate_sample
    all_coor = []
    (0..9).each do |x|
      (0..9).each do |y|
        all_coor.append([x, y])
      end
    end
    @bombs = rand(7..13)
    @bombs_coordinates = all_coor.sample(@bombs)
    @bombs_coordinates
  end

  def create_bomb_board
    @bomb_board = []
    10.times do
      new_row = []
      10.times do
        new_cell = Cell.new(0)
        new_row.append(new_cell)
      end
      @bomb_board.append(new_row)
    end
    @bomb_board
  end

  def put_bombs
    @bombs_coordinates.each do |bomb|
      new_cell = Cell.new(-1)
      @bomb_board[bomb[0]][bomb[1]] = new_cell
    end
  end

  def create_cells
    (0..9).each do |row|
      (0..9).each do |column|
        next if @bomb_board[row][column].value == -1

        number_bombs = check_around_values(@bomb_board, row, column)
        new_cell = Cell.new(number_bombs)
        @bomb_board[row][column] = new_cell
      end
    end
  end
end
