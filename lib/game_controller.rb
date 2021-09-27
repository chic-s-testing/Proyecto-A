# frozen_string_literal: true

# The principal controller for the game
class GameController
  def initialize(boardModel, boardView)
    @model = boardModel
    @view = boardView
  end
end
