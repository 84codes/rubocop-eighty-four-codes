# frozen_string_literal: true

module RuboCop
  module GitlabSecurity
    # Wrapper for RSpec examples
    class Example < Concept
      def_node_matcher :extract_doc_string,     '(send _ _ $str ...)'
      def_node_matcher :extract_metadata,       '(send _ _ _ $...)'
      def_node_matcher :extract_implementation, '(block send args $_)'

      def doc_string
        extract_doc_string(definition)
      end

      def metadata
        extract_metadata(definition)
      end

      def implementation
        extract_implementation(node)
      end

      def definition
        if node.send_type?
          node
        else
          node.children.first
        end
      end
    end
  end
end
