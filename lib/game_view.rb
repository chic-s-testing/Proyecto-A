# frozen_string_literal: true

# Game's view
class GameView
  def print_board(board)
    n = 9
    (0..n).each do |i|
      print '|'
      (0..n).each do |j|
        cell = board[i][j]
        print_value(cell)
      end
      print "\n"
    end
  end

  def print_value(cell)
    if cell.visible
      print "#{cell.value}|" if cell.value != -1
      print 'B|' if cell.value == -1
    elsif cell.flag
      print 'F|'
    else
      print '-|'
    end
  end

  def print_initial_game
    puts '¡Welcome to Minesweeper!'
    puts 'The objective of the game is to clear a minefield without detonating any mine.'
    puts 'You can also put flags where you think there are mines...'
    puts 'Good Luck :)'
  end
end
