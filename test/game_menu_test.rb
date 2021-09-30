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

  def test_request_valid_coordinate_x
    $stdin = StringIO.new('5')
    assert_equal(@menu.request_coordinate('X'), 5)
  end

  def test_request_valid_coordinate_y
    $stdin = StringIO.new('2')
    assert_equal(@menu.request_coordinate('Y'), 2)
  end

  def test_request_not_int_coordinate_x
    $stdin = StringIO.new('one')
    assert_equal(@menu.request_coordinate('X'), 0)
  end

  def test_request_not_int_coordinate_y
    $stdin = StringIO.new('two')
    assert_equal(@menu.request_coordinate('Y'), 0)
  end

  def test_request_outside_board_coordinate_x
    $stdin = StringIO.new('0')
    assert_equal(@menu.request_coordinate('X'), 0)
  end

  def test_request_outside_board_coordinate_y
    $stdin = StringIO.new('11')
    assert_equal(@menu.request_coordinate('Y'), 0)
  end

  def test_request_valid_action
    $stdin = StringIO.new('put flag')
    assert_equal(@menu.request_action, 'put flag')
  end

  def test_request_invalid_action
    $stdin = StringIO.new('put')
    assert_equal(@menu.request_action, 'invalid')
  end
end
