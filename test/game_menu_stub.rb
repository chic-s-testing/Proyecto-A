# frozen_string_literal: true

class GameMenuStub
  def initialize(*); end

  def request_x_coordinate
    1
  end

  def request_y_coordinate
    1
  end

  def request_action
    'uncover cell'
  end
end
