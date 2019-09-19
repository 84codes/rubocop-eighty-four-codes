require 'rake'
require 'rubocop'
require 'rubocop/rake_task'

desc 'Generate a new cop template'
task :new_cop, [:cop] do |_task, args|
  cop_name = args.fetch(:cop) do
    warn 'usage: bundle exec rake new_cop[Name]'
    exit!
  end

  github_user = `git config github.user`.chop
  github_user = 'your_id' if github_user.empty?

  generator = RuboCop::Cop::Generator.new("EightyFourCodes/#{cop_name}", github_user)

  generator.write_source
  generator.write_spec
  # generator.inject_require
  generator.inject_config

  puts generator.todo
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
