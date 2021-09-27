# frozen_string_literal: true

require_relative './game_menu_view'

# Game's menu
class GameMenu

    def initialize(value)
        @game_view = GameMenuView()
        @x = None
        @y = None
        @action = None
    end

    def menu()
        @game_view.puts_start_menu()
        @request_coordinates()
        @request_action()
        return @x, @y, @action
    end

    def request_coordinates()
        @game_view.puts_request_coordinate("X")
        @x = gets.chomp
        @game_view.puts_request_coordinate("Y")
        @y = gets.chomp
    end

    def request_action()
        @game_view.puts_request_action()
        @action = gets.chomp
    end
end
  