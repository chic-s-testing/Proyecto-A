# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/cell'
require 'test/unit'

class CellTest < Test::Unit::TestCase
  def setup
    @cell = Cell.new(0)
  end

  def test_delete_flag
    @cell.put_flag
    @cell.delete_flag
    assert_false(@cell.flag)
  end

  def test_put_flag
    @cell.put_flag
    assert_true(@cell.flag)
  end

  def test_uncover_cell_with_flag
    @cell.put_flag
    value = @cell.uncover_cell
    assert_false(@cell.flag)
    assert_true(@cell.visible)
    assert_equal(0, value)
  end

  def test_uncover_cell_without_flag
    value = @cell.uncover_cell
    assert_false(@cell.flag)
    assert_true(@cell.visible)
    assert_equal(0, value)
  end
end
