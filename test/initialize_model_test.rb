# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/game_model'
require 'test/unit'

class InitializeModelTest < Test::Unit::TestCase
  def setup
    @model = GameModel.new
  end

  def test_amount_not_bombs
    @all_not_bombs = 0
    @model.board.each do |row|
      row.each do |cell|
        @all_not_bombs += 1 if cell.value != -1
      end
    end
    assert_equal(@model.number_not_bombs, @all_not_bombs)
  end

  def test_size
    @cells = 0
    @model.board.each do |row|
      row.each do
        @cells += 1
      end
    end
    assert_equal(@cells, 100)
  end

  def test_put_flag
    @model.board[0][0].put_flag
    assert_true(@model.board[0][0].flag)
  end

  def test_delete_flag
    @model.board[0][0].put_flag
    @model.board[0][0].delete_flag
    assert_false(@model.board[0][0].flag)
  end

  def test_uncover_cell
    value = @model.board[0][0].uncover_cell
    assert_true(@model.board[0][0].visible)
    assert_equal(@model.board[0][0].value, value)
  end
end
