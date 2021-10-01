# frozen_string_literal: true

require 'stringio'
require_relative 'test_helper'
require 'test/unit'
require_relative '../lib/input_validations'

class InputValidationsTest < Test::Unit::TestCase
  def setup
    @input_validation = InputValidations.new
  end

  def test_valid_coordinate
    assert_equal(@input_validation.valid_coordinate(1), true)
  end

  def test_invalid_coordinate
    assert_equal(@input_validation.valid_coordinate(11), false)
  end

  def test_request_valid_action
    $stdin = StringIO.new('put flag')
    assert_equal(@input_validation.valid_action, 'put flag')
  end

  def test_request_invalid_action
    $stdin = StringIO.new('flag')
    assert_equal(@input_validation.valid_action, false)
  end
end
