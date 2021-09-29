# frozen_string_literal: true

require_relative 'cell'
require_relative 'board/cell_values'

# board creation class
class Board
  attr_reader :board, :not_bombs_cells, :bombs, :bombs_coordinates

  def initialize(bomb_seed = 'random')
    coordinate_sample(bomb_seed)
    create_board
    @not_bombs_cells = 100 - @bombs
  end

  def create_board
    create_bomb_board
    put_bombs
    create_cells
  end

  def coordinate_sample(bomb_seed)
    if bomb_seed == 'random'
      random_bombs_sample
    else
      @bombs = bomb_seed.length
      @bombs_coordinates = bomb_seed
    end
  end

  def random_bombs_sample
    all_coor = []
    (0..9).each do |x|
      (0..9).each do |y|
        all_coor.append([x, y])
      end
    end
    @bombs = rand(7..13)
    @bombs_coordinates = all_coor.sample(@bombs)
  end

  def create_bomb_board
    board = []
    10.times do
      new_row = []
      10.times do
        new_cell = Cell.new(0)
        new_row.append(new_cell)
      end
      board.append(new_row)
    end
    @board = board
  end

  def put_bombs
    @bombs_coordinates.each do |bomb|
      new_cell = Cell.new(-1)
      @board[bomb[0]][bomb[1]] = new_cell
    end
  end

  def create_cells
    (0..9).each do |row|
      (0..9).each do |column|
        next if @board[row][column].value == -1

        number_bombs = check_around_values(@board, row, column)
        new_cell = Cell.new(number_bombs)
        @board[row][column] = new_cell
      end
    end
  end
end
