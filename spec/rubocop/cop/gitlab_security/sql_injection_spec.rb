# frozen_string_literal: true

require_relative 'spec_helper'

require_relative '../../../../lib/rubocop/cop/gitlab_security/sql_injection'

RSpec.describe RuboCop::Cop::GitlabSecurity::SqlInjection do
  it 'does not flag correct use' do
    expect_no_offenses(<<~RUBY)
      User.where("name = ? AND id = ?", params[:name], params[:id])
      User.where(name: params[:name], id: params[:id])
    RUBY
  end

  it 'flags incorrect use' do
    expect_offense(<<~'RUBY')
      User.where("name = '#{params[:name]}'")
           ^^^^^ Parameterize all user-input passed to where(), [...]
    RUBY
  end
end
