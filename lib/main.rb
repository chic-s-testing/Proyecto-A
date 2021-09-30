# frozen_string_literal: true

require 'matrix'

require_relative './game_model'
require_relative './game_controller'
require_relative './game_view'
require_relative './game_menu_view'
require_relative './game_menu'

model = GameModel.new
view = GameView.new
menu_view = GameMenuView.new
model.add_observer(view)
game_menu = GameMenu.new(menu_view)
controller = GameController.new(view, model, menu_view, game_menu)

menu_view.puts_initial_game
view.print_board(model.board)
controller.start
