# frozen_string_literal: true

require_relative 'lib/game_view'

# Observer class for the game view
class Observer
  def update(game, board)
    game.print_board(board)
  end
end
