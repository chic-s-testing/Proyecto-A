# frozen_string_literal: true

# Game's menu
class GameMenu
  def initialize(menu_view)
    @game_view = menu_view
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
