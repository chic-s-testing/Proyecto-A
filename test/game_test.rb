# frozen_string_literal: true

require_relative 'test_helper'
require 'test/unit'
require_relative '../lib/game_controller'
require_relative '../lib/game_view'
require_relative '../lib/game_menu_view'

require_relative 'game_menu_stub'
require_relative 'model_stub'

class GameTest < Test::Unit::TestCase
  def setup
    view = GameView.new
    menu_view = GameMenuView.new
    model = GameModelStub.new
    game_menu = GameMenuStub.new(@menu_view)
    @controller = GameController.new(view, model, menu_view, game_menu)
  end

  def test_start
    @controller.start
    assert_not_equal(@controller.status, 'next')
  end
end
