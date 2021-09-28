# frozen_string_literal: true

# Game's controller
class GameController
  def initialize(board_view, board_model)
    @model = board_model
    @view = board_view
  end
end
