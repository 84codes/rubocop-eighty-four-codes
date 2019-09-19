module RuboCop
  module Cop # rubocop:disable Style/Documentation
    WorkaroundCop84 = Cop.dup

    # Clone of the the normal RuboCop::Cop::Cop class so we can rewrite
    # the inherited method without breaking functionality
    class WorkaroundCop84
      # Overwrite the cop inherited method to be a noop. Our RSpec::Cop
      # class will invoke the inherited hook instead
      def self.inherited(*); end

      # Special case `Module#<` so that the rspec support rubocop exports
      # is compatible with our subclass
      def self.<(other)
        other.equal?(RuboCop::Cop::Cop) || super
      end
    end
    private_constant(:WorkaroundCop84)

    module EightyFourCodes
      # @abstract parent class to rspec cops
      #
      # The criteria for whether rubocop-rspec analyzes a certain ruby file
      # is configured via `AllCops/RSpec`. For example, if you want to
      # customize your project to scan all files within a `test/` directory
      # then you could add this to your configuration:
      #
      # @example configuring analyzed paths
      #
      #   AllCops:
      #     RSpec:
      #       Patterns:
      #       - '_test.rb$'
      #       - '(?:^|/)test/'
      class Cop < WorkaroundCop84
        include RuboCop::EightyFourCodes::Language
        include RuboCop::EightyFourCodes::Language::NodePattern

        DEFAULT_CONFIGURATION =
          RuboCop::EightyFourCodes::CONFIG.fetch('AllCops').fetch('EightyFourCodes')

        # Invoke the original inherited hook so our cops are recognized
        def self.inherited(subclass)
          RuboCop::Cop::Cop.inherited(subclass)
        end

        def relevant_file?(file)
          relevant_rubocop_rspec_file?(file) && super
        end

        private

        def relevant_rubocop_rspec_file?(file)
          rspec_pattern =~ file
        end

        def rspec_pattern
          Regexp.union(rspec_pattern_config.map(&Regexp.public_method(:new)))
        end

        def rspec_pattern_config
          config
            .for_all_cops
            .fetch('EightyFourCodes', DEFAULT_CONFIGURATION)
            .fetch('Patterns')
        end
      end
    end
  end
end
