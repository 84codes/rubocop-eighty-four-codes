module RuboCop
  module Cop
    module GitlabSecurity
      # Check for use of where("name = '#{params[:name]}'")
      #
      # Passing user input to where() without parameterization can result in SQL Injection
      # 
      # @example
      #
      #   # bad
      #   u = User.where("name = '#{params[:name]}'")
      # 
      #   # good (parameters)
      #   u = User.where("name = ? AND id = ?", params[:name], params[:id])
      #   u = User.where(name: params[:name], id: params[:id])
      #
      class SqlInjection < RuboCop::Cop::Cop
        MSG = 'Parameterize all user-input passed to where(), do not directly embed user input in SQL queries'
   
        def_node_matcher :where_user_input?, <<-PATTERN
          (send _ :where ...)
        PATTERN

        def_node_matcher :string_var_string?, <<-PATTERN
          (dstr (str ...) (begin ...) (str ...) ...)
        PATTERN

        def on_send(node)
          return unless where_user_input?(node)
          return unless node.method_args.any? { |e| string_var_string?(e) }

          add_offense(node, :selector)
        end
      end
    end
  end
end
