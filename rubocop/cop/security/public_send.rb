module RuboCop
  module Cop
    module GitlabChecks
      class NoPublicSendMethod < RuboCop::Cop::Cop
        MSG = 'Avoid using `send`'

        def on_send(node)
          return if !node.command?(:send) || !node.command?(:public_send)
          add_offense(node, :selector)
        end
      end
    end
  end
end
