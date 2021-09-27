# frozen_string_literal: true

require 'matrix'

require_relative './game_model'
require_relative './game_controller'
require_relative './game_view'
require_relative './game_menu_view'

model = GameModel.new
view = GameView.new
menu_view = GameMenuView.new
model.addObserver(view, menu_view)
controller = BoardController.new(model, view, menu_view)

menu_view.print_initial_game
controller.print_board
controller.request_input
