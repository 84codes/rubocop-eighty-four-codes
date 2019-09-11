require 'pathname'
require 'yaml'

require 'rubocop'

require 'rubocop/eightyfourcodes'
require 'rubocop/eightyfourcodes/version'
require 'rubocop/eightyfourcodes/inject'
require 'rubocop/eightyfourcodes/top_level_describe'
require 'rubocop/eightyfourcodes/wording'
require 'rubocop/eightyfourcodes/util'
require 'rubocop/eightyfourcodes/language'
require 'rubocop/eightyfourcodes/language/node_pattern'
require 'rubocop/eightyfourcodes/concept'
require 'rubocop/eightyfourcodes/example_group'
require 'rubocop/eightyfourcodes/example'
require 'rubocop/eightyfourcodes/hook'
require 'rubocop/cop/eightyfourcodes/cop'

RuboCop::EightyFourCodes::Inject.defaults!

require 'rubocop/cop/eightyfourcodes/command_literal_injection'
