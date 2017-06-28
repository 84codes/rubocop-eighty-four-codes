module RuboCop
  module Cop
    module GitlabSecurity
      # Check for use of redirect_to(params.update())
      #
      # Passing user params to the redirect_to method provides an open redirect
      # 
      # @example
      #
      #   # bad
      #   redirect_to(params.update(action:'main'))
      # 
      #   # good
      #   redirect_to(whitelist(params))
      #
      class SendFileParams < RuboCop::Cop::Cop
        MSG = 'Do not pass user provided params to send_file()'

#          (send nil :send_file (send (send nil :params) ... ))

        def_node_search :params_node?, <<-PATTERN
           (send (send nil :params) ... )
        PATTERN

        def on_send(node)
          return unless node.command?(:send_file)
          return unless node.method_args.any? { |e| params_node?(e) }
#          node.method_args.any? { |a| puts "#{a}" }

          add_offense(node, :selector)
        end
      end
    end
  end
end
