# frozen_string_literal: true

require_relative 'cell'

# Model for Minesweeper
class GameModel
  def initialize
    @board = create_board
  end

  def create_board
    @bombs = rand(7..13)
    @coordinates = []
    (1..@bombs).each do
      @coordinates.append([rand(0..9), rand(0..9)])
    end
    print(@coordinates)
    @bomb_board = []
    for row in 1 .. 10
      @new_row = []
      for column in 1 .. 10
        new_cell = Cell.new(0)
        @new_row.append(new_cell)
      end
      @bomb_board.append(@new_row)
    end
    for bomb in 0..(@coordinates.length-1)
      new_cell = Cell.new(-1)
      puts(bomb)
      print(@coordinates[bomb])
      @bomb_board[@coordinates[bomb][0]][@coordinates[bomb][1]] = new_cell
    end
    for row in 0 .. 9
      for column in 0 .. 9
        if (@bomb_board[row][column].value != -1)
          number_bombs = check_around_values(@bomb_board, row, column)
          puts(number_bombs)
          new_cell = Cell.new(number_bombs)
          @bomb_board[row][column] = new_cell
        end
      end
    end 

    print(@bomb_board[0])
    print("\n")
    @bomb_board.each do |row|
      row.each do |cell|
        print(cell.value)
      end
      print("\n")
    end
    @bomb_board
  end

  def check_around_values(board, row, column)
    spaces_to_check = [[1,1], [1,-1], [(-1),-1], [(-1), 1], [1,0], [0,1], [(-1),0], [0,-1]]
    spaces_to_check_col_1 = [[1,1], [(-1), 1], [1,0], [0,1], [(-1),0]]
    spaces_to_check_row_9 = [ [-1,-1], [-1, 1], [0,1], [-1,0], [0,-1]]
    bombs = 0

    if row < 9
      if column > 0
        spaces_to_check.each do |space|
          if (board[row + space[0]][column + space[1]] != nil && board[row + space[0]][column + space[1]].value == -1)
            bombs += 1
          end
        end
      else
        spaces_to_check_col_1.each do |space|
          if (board[row + space[0]][column + space[1]] != nil && board[row + space[0]][column + space[1]].value == -1)
            bombs += 1
          end
        end
      end
    else
      
      spaces_to_check_row_9.each do |space|
        if (board[row + space[0]][column + space[1]] != nil && board[row + space[0]][column + space[1]].value == -1)
          bombs += 1
        end
      end
    end
    bombs
  end
end


game = GameModel.new()