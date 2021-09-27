# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/board_creation'
require 'test/unit'

class CreateBoardTest < Test::Unit::TestCase
  def setup
    @board = Board.new
  end

  def test_amount_bombs
    @all_bombs = 0
    @board.board.each do |row|
      row.each do |cell|
        @all_bombs += 1 if cell.value == -1
      end
    end
    assert_equal(@board.bombs, @all_bombs)
  end

  def test_amount_not_bombs
    @all_not_bombs = 0
    @board.board.each do |row|
      row.each do |cell|
        @all_not_bombs += 1 if cell.value != -1
      end
    end
    assert_equal(@board.not_bombs_cells, @all_not_bombs)
  end

  def test_size
    @cells = 0
    @board.board.each do |row|
      row.each do
        @cells += 1
      end
    end
    assert_equal(@cells, 100)
  end

  def test_put_flag
    @board.board[0][0].put_flag
    assert_true(@board.board[0][0].flag)
  end

  def test_delete_flag
    @board.board[0][0].put_flag
    @board.board[0][0].delete_flag
    assert_false(@board.board[0][0].flag)
  end

  def test_uncover_cell
    value = @board.board[0][0].uncover_cell
    assert_true(@board.board[0][0].visible)
    assert_equal(@board.board[0][0].value, value)
  end
end
