# frozen_string_literal: true

require_relative 'cell'

# Model for Minesweeper
class GameModel
  def initialize
    @board = create_board
  end

  def create_board
    coordinate_sample
    create_bomb_board
    put_bombs
    create_cells
    @bomb_board
  end

  def print_board
    @bomb_board.each do |row|
      row.each do |cell|
        print(cell.value)
      end
      print("\n")
    end
  end

  def check_around_values(board, row, column)
    spaces_to_check = [[1, 1], [1, -1], [-1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]]
    spaces_to_check_col = [[1, 1], [-1, 1], [1, 0], [0, 1], [-1, 0]]
    spaces_to_check_row = [[-1, -1], [-1, 1], [0, 1], [-1, 0], [0, -1]]
    bombs = 0
    if row < 9
      if column.positive?
        spaces_to_check.each do |space|
          if !board[row + space[0]][column + space[1]].nil? && board[row + space[0]][column + space[1]].value == -1
            bombs += 1
          end
        end
      else
        spaces_to_check_col.each do |space|
          if !board[row + space[0]][column + space[1]].nil? && board[row + space[0]][column + space[1]].value == -1
            bombs += 1
          end
        end
      end
    else
      spaces_to_check_row.each do |space|
        if !board[row + space[0]][column + space[1]].nil? && board[row + space[0]][column + space[1]].value == -1
          bombs += 1
        end
      end
    end
    bombs
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
    9.times do
      new_row = []
      9.times do
        new_cell = Cell.new(0)
        new_row.append(new_cell)
      end
      @bomb_board.append(new_row)
    end
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

GameModel.new
