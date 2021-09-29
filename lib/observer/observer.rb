# frozen_string_literal: true

require_relative 'lib/game_view'

# Observer class for the game view
class Observer
  def update(_board)
    raise 'Cannot initialize an abstract method'
  end
end
