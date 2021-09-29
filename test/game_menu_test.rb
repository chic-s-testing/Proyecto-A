# frozen_string_literal: true

require 'stringio'
require_relative 'test_helper'
require 'test/unit'
require_relative '../lib/game_menu'
require_relative '../lib/game_menu_view'

class GameMenuTest < Test::Unit::TestCase
  def setup
    menu_view = GameMenuView.new
    @menu = GameMenu.new(menu_view)
  end

  def test_request_x_coordinate
    $stdin = StringIO.new('10')
    assert_equal(@menu.request_x_coordinate, 10)
  end

  def test_request_y_coordinate
    $stdin = StringIO.new('1')
    assert_equal(@menu.request_y_coordinate, 1)
  end

  def test_request_action
    $stdin = StringIO.new('put flag')
    assert_equal(@menu.request_action, 'put flag')
  end
end
