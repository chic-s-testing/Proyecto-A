# frozen_string_literal: true

def check_around_values(board, row, column)
  spaces_to_check = [[1, 1], [1, -1], [-1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  bombs = 0
  spaces_to_check.each do |coordinate|
    row_to_check = row + coordinate[0]
    col_to_check = column + coordinate[1]
    bombs += 1 if in_board(row_to_check, col_to_check) && board[row_to_check][col_to_check].value == -1
  end
  bombs
end

def in_board(row_to_check, col_to_check)
  (row_to_check) <= 9 && (row_to_check) >= 0 && (col_to_check) <= 9 && (col_to_check) >= 0
end
