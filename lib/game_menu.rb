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
    coordinate = valid_coordinate
    return coordinate if coordinate

    0
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
    coordinate = @input_validation.valid_integer_input
    unless coordinate
      @game_menu_view.puts_invalid_type_input('integer')
      return 0
    end
    valid = @input_validation.valid_coordinate(coordinate)
    return coordinate if valid

    @game_menu_view.puts_invalid_coordinate
    0
  end
end
