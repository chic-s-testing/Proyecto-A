# frozen_string_literal: true

require_relative './game_menu_view'
require_relative './input_validations'

# Game's menu
class GameMenu
  def initialize(menu_view)
    @game_menu_view = menu_view
    @input_validation = InputValidations.new
  end

  def request_coordinate(coordinate)
    @game_menu_view.puts_request_coordinate(coordinate)
    valid_coordinate
  end

  def request_action
    @game_menu_view.puts_request_action
    action = @input_validation.valid_action
    if action
      action
    else
      @game_menu_view.puts_invalid_action
      'invalid'
    end
  end

  def valid_coordinate
    coordinate = $stdin.gets.to_i
    valid = @input_validation.valid_coordinate(coordinate)
    return coordinate if valid

    @game_menu_view.puts_invalid_coordinate
    0
  end
end
