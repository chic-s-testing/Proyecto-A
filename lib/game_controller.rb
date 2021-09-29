# frozen_string_literal: true

# Game's controller
class GameController
  def initialize(board_view, board_model)
    @model = board_model
    @view = board_view
  end

  def select_coordinates(row, col, action = 'uncover')
    case action
    when 'uncover'
      return 'game_over' if check_game_over(row, col)

      @model.mark_uncover(row, col)
      return 'winner' if check_game_over_routine(row, col)
    when 'put_flag' then @model.mark_add_flag(row, col)
    when 'remove_flag' then @model.mark_remove_flag(row, col)
    end
    'next'
  end

  def check_winner_routine(row, col)
    if @view.check_cell_bomb(row, col)
      @view.puts_game_over
      return true
    end
    false
  end

  def check_game_over_routine(_row, _col)
    if @model.winner
      @view.puts_congratulation
      return true
    end
    false
  end
end
