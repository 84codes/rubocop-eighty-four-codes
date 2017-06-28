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
      class RedirectToParamsUpdate < RuboCop::Cop::Cop
        MSG = 'Avoid using redirect_to(params.update())'

        def_node_matcher :redirect_to_params_update_node, <<-PATTERN
          (send nil :redirect_to (send (lvar :params) :update ...))
        PATTERN

        def on_send(node)
          return unless redirect_to_params_update_node(node)

          add_offense(node, :selector)
        end
      end
    end
  end
end
