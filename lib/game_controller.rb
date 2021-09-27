# frozen_string_literal: true

class GameController
  def initialize(boardModel, boardView)
    @model = boardModel
    @view = boardView
  end
end
