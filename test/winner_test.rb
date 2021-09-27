# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/game_model'
require 'test/unit'

class InitializeModelTest < Test::Unit::TestCase
  def setup
    @model = GameModel.new
  end

  def winner_test
    @model.board.each do |row|
      row.each do |cell|
        cell.uncover if cell.value >= 0
      end
    end
    assert_true(@model.winner)
  end
end
