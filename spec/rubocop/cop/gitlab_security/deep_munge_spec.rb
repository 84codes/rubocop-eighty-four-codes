# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../lib/rubocop/cop/gitlab_security/deep_munge'

RSpec.describe RuboCop::Cop::GitlabSecurity::DeepMunge do
  it 'ignores setting to true' do
    expect_no_offenses(<<~RUBY)
      config.action_dispatch.perform_deep_munge = true
    RUBY
  end

  it 'adds an offense for setting it to `false`' do
    expect_offense(<<~RUBY)
      config.action_dispatch.perform_deep_munge = false
                             ^^^^^^^^^^^^^^^^^^ Never disable the deep munge security option.

      config.action_dispatch.perform_deep_munge = !true
                             ^^^^^^^^^^^^^^^^^^ Never disable the deep munge security option.
    RUBY
  end
end
