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

  def puts_congratulation
    puts 'Congratulations! You just won!'
  end

  def puts_game_over
    puts '¡Oh no! You have stepped on a mine, game over :(.'
  end

  def update(model)
    print_board(model.board)
  end
end
