require 'rake'
require 'rubocop'
require 'rubocop-eightyfourcodes'
require 'rubocop/rake_task'

module RuboCop
  module Cop
    class Generator
      def bump_minor_version
        versions = RuboCop::EightyFourCodes::Version::STRING.split('.')

        "#{versions[0]}.#{versions[1].succ}.0"
      end

      class ConfigurationInjector
        alias old_find_target_line find_target_line

        def find_target_line
          old_find_target_line + 1
        end
      end
    end
  end
end

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
