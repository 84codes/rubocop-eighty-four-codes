$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'rubocop/eighty_four_codes/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-eightyfourcodes'
  spec.summary = 'Basic security checks for projects'
  spec.description = <<~DESCRIPTION
    Basic security checking for Ruby files.
    A plugin for the RuboCop code style enforcing & linting tool.
  DESCRIPTION
  spec.homepage = 'https://github.com/84codes/rubocop-eightyfourcodes/'
  spec.authors = ['Anders Bälter', 'Brian Neel']
  spec.email = [
    'anders@eightyfourcodes.com',
    'brian@gitlab.com'
  ]
  spec.licenses = ['MIT']

  spec.version = RuboCop::EightyFourCodes::Version::STRING
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.3.0'

  spec.require_paths = ['lib']
  spec.files = Dir[
    '{config,lib}/**/*',
    '*.md',
    '*.gemspec',
    'Gemfile'
  ]
  spec.extra_rdoc_files = ['LICENSE.md', 'README.md']

  spec.add_runtime_dependency 'rubocop', '>= 0.51'

  spec.add_development_dependency 'rake'
end
