# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %w[lint test]

task :test do
  ruby 'test/cell_test.rb'
  ruby 'test/initialize_model_test.rb'
  ruby 'test/create_board_test.rb'
  ruby 'test/game_menu_test.rb'
  ruby 'test/winner_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
end
