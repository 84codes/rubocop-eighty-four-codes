This is a collection of cops developed and used by eighty-four-codes AB
This code is based heavily upon the [rubocop-gitlab-security](https://gitlab.com/gitlab-org/rubocop-gitlab-security)
code released under the MIT License.

## Installation

Just install the `rubocop-eighty-four-codes` gem

```bash
gem install rubocop-eighty-four-codes
```

or if you use bundler put this in your `Gemfile`

```yaml
gem 'rubocop-eighty-four-codes'
```

## Usage

You need to tell RuboCop to load the eighty-four-codes extension. There are three
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```yaml
require: rubocop-eighty-four-codes
```

Now you can run `rubocop` and it will automatically load the RuboCop eighty-four-codes
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-eighty-four-codes
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-eighty-four-codes'
end
```

## Inspecting specific files

By default, `rubocop-eighty-four-codes` inspects all files. You can override this setting in your config file by specifying one or more patterns:

```yaml
# Inspect all files
AllCops:
  eighty-four-codes:
    Patterns:
    - '.+'
```

```yaml
# Inspect only controller files.
AllCops:
  eighty-four-codes:
    Patterns:
    - app/controllers/**/*.rb
```

## The Cops

All cops are located under
[`lib/rubocop/cop/eighty-four-codes`](lib/rubocop/cop/eighty-four-codes), and contain
examples/documentation.

In your `.rubocop.yml`, you may treat the eighty-four-codes cops just like any other
cop. For example:

```yaml
EightyFourCodes/PublicSend:
  Exclude:
    - 'spec/**/*'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Merge Request

## License

`rubocop-eighty-four-codes` is MIT licensed. [See the accompanying file](LICENSE.md) for
the full text.
