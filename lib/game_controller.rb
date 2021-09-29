# frozen_string_literal: true

# Game's controller
class GameController
  def initialize(board_view, board_model, menu_view, game_menu)
    @model = board_model
    @view = board_view
    @menu_view = menu_view
    @game_menu = game_menu
  end

  def start; end
end
