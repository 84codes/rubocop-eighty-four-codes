RSpec.describe RuboCop::Cop::GitlabSecurity::PublicSend do
  subject(:cop) { described_class.new }

  shared_examples 'an upstanding constable' do |method|
    def highlight_for(method)
      "#{'^' * method.to_s.length} Avoid using `#{method}`."
    end

    it "adds an offense for `#{method}`" do
      expect_offense(<<-RUBY)
        basic.#{method}(:bar)
              #{highlight_for(method)}
      RUBY
    end

    it "adds an offense for `#{method}` with arguments" do
      expect_offense(<<-RUBY)
        args.#{method}(:bar, baz: true)
             #{highlight_for(method)}
      RUBY
    end

    it "adds offense for `#{method}` on `nil` receiver" do
      expect_offense(<<-RUBY)
        #{method}(:foo)
        #{highlight_for(method)}
      RUBY
    end

    it "ignores `#{method}` with no argument" do
      expect_no_offenses("foo.#{method}")
    end
  end

  include_examples 'an upstanding constable', :send
  include_examples 'an upstanding constable', :public_send
  include_examples 'an upstanding constable', :__send__
end
