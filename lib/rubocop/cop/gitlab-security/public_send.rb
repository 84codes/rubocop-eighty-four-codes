module RuboCop
  module Cop
    module GitlabSecurity
      class PublicSend < RuboCop::Cop::Cop
        MSG = 'Avoid using `send`'

        def on_send(node)
          return if !node.command?(:send) || !node.command?(:public_send)
          add_offense(node, :selector)
        end
      end
    end
  end
end
