# frozen_string_literal: true

def check_around_values(board, row, column)
  bombs = 0
  spaces_to_check = space_list(row, column)
  spaces_to_check.each do |space|
    bombs += 1 if !board[row + space[0]][column + space[1]].nil? && board[row + space[0]][column + space[1]].value == -1
  end
  bombs
end

def space_list(row, column)
  spaces_to_check = []
  spaces_to_check.append([-1, -1]) if row.positive? && column.positive?
  spaces_to_check.append([0, -1]) if column.positive?
  spaces_to_check.append([-1, 0]) if row.positive?
  spaces_to_check.append([-1, 1]) if column < 9 && row.positive?
  spaces_to_check.append([0, 1]) if column < 9
  spaces_to_check.append([1, 1]) if column < 9 && row < 9
  spaces_to_check.append([1, 0]) if row < 9
  spaces_to_check.append([1, -1]) if column.positive? && row < 9
  spaces_to_check
end
