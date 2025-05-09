# frozen_string_literal: true

require_relative 'lib/rubocop/eightyfourcodes/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-eightyfourcodes'
  spec.version = RuboCop::EightyFourCodes::VERSION
  spec.authors = ['Anders Bälter']
  spec.email = ['anders@84codes.com']

  spec.summary = 'This is a collection of cops developed and used by 84codes AB.'
  spec.description = <<~DESCRIPTION
    A plugin for the RuboCop code style enforcing & linting tool.
  DESCRIPTION
  spec.homepage = 'https://github.com/84codes/rubocop-eightyfourcodes/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end

  spec.require_paths = ['lib']
  spec.add_dependency 'rubocop', ['>= 1.69.0', '< 2']
  spec.extra_rdoc_files = ['LICENSE.md', 'README.md']
end
