# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/game_model'
require 'test/unit'

class ModelWinnerTest < Test::Unit::TestCase
  def setup
    @model = GameModel.new()
  end

  def test_not_winner_first_cell
    cells_discovered = 0
    @model.board.each do |row|
      row.each do |cell|
        cell.uncover_cell if cell.value >= 0 && cells_discovered.zero?
      end
    end
    assert_false(@model.winner)
  end

  def test_not_winner_random_cell
    @model.board[rand(0..9)][rand(0..9)] if @model.board[rand(0..9)][rand(0..9)].value >= 0
    assert_false(@model.winner)
  end

  def test_winner
    (0..9).each do | row |
      (0..9).each do | col | 
        @model.mark_uncover(row, col) if @model.board[row][col].value >= 0
      end
    end
    assert_true(@model.winner)
  end
end
