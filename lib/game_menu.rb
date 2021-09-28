# frozen_string_literal: true

require_relative './game_menu_view'

# Game's menu
class GameMenu
  def initialize
    @game_view = GameMenuView.new
  end

  def request_x_coordinate
    @game_view.puts_request_coordinate('X')
    $stdin.gets.to_i
  end

  def request_y_coordinate
    @game_view.puts_request_coordinate('Y')
    $stdin.gets.to_i
  end

  def request_action
    @game_view.puts_request_action
    $stdin.gets.to_s
  end
end
