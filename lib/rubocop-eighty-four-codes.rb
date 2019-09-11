require 'pathname'
require 'yaml'

require 'rubocop'

require 'rubocop/eighty-four-codes'
require 'rubocop/eighty-four-codes/version'
require 'rubocop/eighty-four-codes/inject'
require 'rubocop/eighty-four-codes/top_level_describe'
require 'rubocop/eighty-four-codes/wording'
require 'rubocop/eighty-four-codes/util'
require 'rubocop/eighty-four-codes/language'
require 'rubocop/eighty-four-codes/language/node_pattern'
require 'rubocop/eighty-four-codes/concept'
require 'rubocop/eighty-four-codes/example_group'
require 'rubocop/eighty-four-codes/example'
require 'rubocop/eighty-four-codes/hook'
require 'rubocop/cop/eighty-four-codes/cop'

RuboCop::EightyFourCodes::Inject.defaults!

require 'rubocop/cop/eighty-four-codes/command_literal_injection'
