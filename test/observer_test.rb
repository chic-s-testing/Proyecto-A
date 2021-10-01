# frozen_string_literal: true

require_relative 'test_helper'
require 'test/unit'
require_relative '../lib/observer/observable'
require_relative '../lib/observer/observer'

class ObserverTest < Test::Unit::TestCase
  def setup
    @observable = Observable.new
    @observer = Observer.new
  end

  def test_add_observer
    @observable.add_observer(@observer)
    assert_equal(@observable.observers[0], @observer)
  end

  def test_update_error
    board = []
    assert_raise(RuntimeError.new('Cannot initialize an abstract method')) { @observer.update(board) }
  end
end
