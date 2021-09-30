# frozen_string_literal: true

class GameModelStub
  attr_reader :board, :number_not_bombs, :board_instance

  def initialize(*); end

  def check_cell_bomb(*)
    false
  end

  def winner
    true
  end

  def mark_uncover(*); end
end
