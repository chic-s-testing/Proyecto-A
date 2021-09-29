# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/game_view'
require_relative '../lib/game_model'
require_relative '../lib/game_menu_view'
require_relative '../lib/game_controller'
require_relative '../lib/game_menu'

require 'test/unit'

class GameControllerTest < Test::Unit::TestCase
  def setup
    @model = GameModel.new([[0, 0]])
    @view = GameView.new
    @menu_view = GameMenuView.new
    game_menu = GameMenu.new(@menu_view)
    @controller = GameController.new(@view, @model, @menu_view, game_menu)
    $stdout = File.open(File::NULL, 'w')
  end

  def test_select_coordinates_put_flag
    status = @controller.select_coordinates(0, 0, 'put_flag')
    assert_true(@model.board[0][0].flag)
    assert_equal('next', status)
  end

  def test_select_coordinates_remove_flag
    status = @controller.select_coordinates(0, 0, 'remove_flag')
    assert_false(@model.board[0][0].flag)
    assert_equal('next', status)
  end

  def test_select_coordinates_uncover_is_loser
    status = @controller.select_coordinates(0, 0, 'uncover')
    assert_equal('game_over', status)
  end

  def test_select_coordinates_uncover_is_winner
    (0...10).each do |row|
      (0...10).each do |col|
        @controller.select_coordinates(row, col, 'uncover') unless [row, col] == [0, 0] || [row, col] == [9, 9]
      end
    end
    @view.print_board(@model.board)
    status = @controller.select_coordinates(9, 9, 'uncover')
    assert_equal('winner', status)
  end
end
