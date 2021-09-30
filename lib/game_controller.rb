# frozen_string_literal: true

# Game's controller
class GameController
  attr_reader :status

  def initialize(board_view, board_model, menu_view, game_menu)
    @model = board_model
    @view = board_view
    @menu_view = menu_view
    @game_menu = game_menu
    @status = 'next'
  end

  def start
    while @status == 'next'
      row = @game_menu.request_coordinate('x')
      col = @game_menu.request_coordinate('y')
      action = @game_menu.request_action
      @status = select_coordinates(row, col, action.chomp)
    end
  end

  def select_coordinates(row, col, action = 'uncover')
    row, col = convert_input_to_coordinates(row, col)
    case action
    when 'uncover cell'
      return 'game_over' if check_game_over_routine(row, col)

      @model.mark_uncover(row, col)
      return 'winner' if check_winner_routine
    when 'put flag' then @model.mark_add_flag(row, col)
    when 'delete flag' then @model.mark_remove_flag(row, col)
    end
    'next'
  end

  def check_winner_routine
    if @model.winner
      @view.puts_congratulation
      return true
    end
    false
  end

  def check_game_over_routine(row, col)
    if @model.check_cell_bomb(row, col)
      @view.puts_game_over
      return true
    end
    false
  end

  def convert_input_to_coordinates(row, col)
    [row - 1, col - 1]
  end
end
