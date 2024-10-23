# frozen_string_literal: true

module RuboCop
  module Cop
    module EightyFourCodes
      # Check for use of `/bin/ls #{params[:file]}` and %x(/bin/ls #{params[:file]})
      #
      # Passing user input to `` and %x without sanitization and parameterization can result in command injection
      #
      # @example
      #
      #   # bad
      #   %x(/bin/ls #{filename})
      #
      #   # good (parameters)
      #   system("/bin/ls", filename)
      #   # even better
      #   exec("/bin/ls", shell_escape(filename))
      #
      class CommandLiteralInjection < Base
        MSG = 'Do not include variables command literals. Use parameters "system(cmd, params)" or exec() instead'

        def_node_matcher :literal_var?, <<-PATTERN
          (begin ...)
        PATTERN

        def on_xstr(node)
          check_for_interpolation(node)
        end

        def check_for_interpolation(node)
          return if node.children.none? { |n| literal_var?(n) }

          add_offense(node)
        end
      end
    end
  end
end
