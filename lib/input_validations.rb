# frozen_string_literal: true

# Input's validations
class InputValidations
  def valid_coordinate(coordinate)
    return true if coordinate >= 1 && coordinate <= 10

    false
  end

  def valid_action
    action = $stdin.gets.to_s.split("\n")[0]
    return action if ['put flag', 'delete flag', 'uncover cell'].include?(action)

    false
  end
end
