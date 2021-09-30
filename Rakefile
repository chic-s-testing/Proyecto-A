# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rake/testtask'

task default: %w[lint test]

Rake::TestTask.new("test:all") do |t| 
  t.libs = ["lib"] 
  t.warning = true 
  t.test_files = FileList['test/**/*_test.rb'] 
end

task :test do
  ruby 'test/cell_test.rb'
  ruby 'test/initialize_model_test.rb'
  ruby 'test/create_board_test.rb'
  ruby 'test/game_menu_test.rb'
  ruby 'test/winner_test.rb'
  ruby 'test/input_validations_test.rb'
  ruby 'test/controller_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
end
