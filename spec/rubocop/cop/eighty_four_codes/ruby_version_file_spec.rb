# frozen_string_literal: true

RSpec.describe RuboCop::Cop::EightyFourCodes::RubyVersionFile do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense defined with double quotes' do
    expect_offense(<<~'RUBY', 'Gemfile')
      ruby "2.6.6"
           ^^^^^^^ Control Ruby version via .ruby-version, fix by replacing with File.read('.ruby-version')
    RUBY

    expect_correction(<<~RUBY)
      ruby File.read('.ruby-version')
    RUBY
  end

  it 'registers an offense defined with single quotes' do
    expect_offense(<<~'RUBY', 'Gemfile')
      ruby '2.1.0'
           ^^^^^^^ Control Ruby version via .ruby-version, fix by replacing with File.read('.ruby-version')
    RUBY

    expect_correction(<<~RUBY)
      ruby File.read('.ruby-version')
    RUBY
  end

  it 'does not register an offense when not in Gemfile' do
    expect_no_offenses(<<~RUBY, 'test.rb')
      ruby '2.1.0'
    RUBY
  end

  it 'does not register an offense when reading .ruby-version' do
    expect_no_offenses(<<~RUBY, 'Gemfile')
      ruby File.read('.ruby-version')
    RUBY
  end
end
