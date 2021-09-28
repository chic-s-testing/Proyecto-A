# frozen_string_literal: true

# Game's menu view
class GameMenuView
  def puts_start_menu
    puts 'Menu Minesweeper'
  end

  def puts_request_coordinate(coordinate)
    puts "Write the coordinate #{coordinate}:"
  end

  def puts_request_action
    puts 'Please Write the action you want to do (put flag, delete flag, uncover cell):'
  end

  def puts_initial_game
    puts '¡Welcome to Minesweeper!'
    puts 'The objective of the game is to clear a minefield without detonating any mine.'
    puts 'You can also put flags where you think there are mines...'
    puts 'Good Luck :)'
  end
end
