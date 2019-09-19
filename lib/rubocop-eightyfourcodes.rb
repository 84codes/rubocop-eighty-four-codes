require 'pathname'
require 'yaml'

require 'rubocop'

require 'rubocop/eighty_four_codes'
require 'rubocop/eighty_four_codes/version'
require 'rubocop/eighty_four_codes/inject'
require 'rubocop/eighty_four_codes/top_level_describe'
require 'rubocop/eighty_four_codes/wording'
require 'rubocop/eighty_four_codes/util'
require 'rubocop/eighty_four_codes/language'
require 'rubocop/eighty_four_codes/language/node_pattern'
require 'rubocop/eighty_four_codes/concept'
require 'rubocop/eighty_four_codes/example_group'
require 'rubocop/eighty_four_codes/example'
require 'rubocop/eighty_four_codes/hook'
require 'rubocop/cop/eighty_four_codes/cop'

RuboCop::EightyFourCodes::Inject.defaults!

Dir["#{__dir__}/rubocop/cop/eighty_four_codes/**/*.rb"].each { |cop| require cop }
