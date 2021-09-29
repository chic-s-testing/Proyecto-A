# frozen_string_literal: true

# Class to store the information in each cell on the board
class Cell
  attr_reader :flag, :value, :visible

  def initialize(value)
    @flag = false
    @value = value
    @visible = false
  end

  def put_flag
    @flag = true
  end

  def delete_flag
    @flag = false
  end

  def uncover_cell
    delete_flag() if @flag
    @visible = true
    @value
  end
end
