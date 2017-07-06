module RuboCop
  module Cop
    module GitlabSecurity
      # Check for use of the dangerous public_send() and send() methods.
      #
      # If passed untrusted input these methods can be used to execute arbitrary methods on behalf
      # of an attacker.
      # 
      # @example
      #
      #   # bad
      #   myobj.public_send("#{params[:foo]}")
      # 
      #   # good
      #   case params[:foo].to_s
      #   when 'choice1'
      #     items.choice1
      #   when 'choice2'
      #     items.choice2
      #   when 'choice3'
      #     items.choice3
      #   end
      #
      class PublicSend < RuboCop::Cop::Cop
        MSG = "Avoid using `%s`"

        def on_send(node)
          return unless node.command?(:send) || node.command?(:public_send)

          append_error = node.command?(:send) ? "send()" : "public_send()"
          add_offense(node, :selector, format(MSG, append_error))
        end
      end
    end
  end
end
