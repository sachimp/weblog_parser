require 'rubocop/rake_task'

task default: %w[lint test]

task :run do
  ruby 'lib/parser.rb'
end

task :test do
  ruby 'test/challenge_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/parser.rb', 'test/challenge_test.rb']
  task.fail_on_error = false
end
