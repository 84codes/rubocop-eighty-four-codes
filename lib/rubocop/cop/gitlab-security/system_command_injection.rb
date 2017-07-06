module RuboCop
  module Cop
    module GitlabSecurity
      # Check for use of system("/bin/ls #{params[:file]}")
      #
      # Passing user input to system() without sanitization and parameterization can result in command injection
      # 
      # @example
      #
      #   # bad
      #   system("/bin/ls #{filename}")
      # 
      #   # good (parameters)
      #   system("/bin/ls", filename)
      #   # even better
      #   exec("/bin/ls", shell_escape(filename))
      #
      class SystemCommandInjection < RuboCop::Cop::Cop
        MSG = 'Do not include variables in the command name for system(). Use parameters "system(cmd, params)" or exec() instead.'
   
        def_node_matcher :system_var?, <<-PATTERN
          (dstr (str ...) (begin ...) ...)
        PATTERN

        def on_send(node)
          return unless node.command?(:system)
          return unless node.method_args.any? { |e| system_var?(e) }

          add_offense(node, :selector)
        end
      end
    end
  end
end
