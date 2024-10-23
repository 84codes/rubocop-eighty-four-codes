# Changelog

## 0.0.3 (2024-10-23)

- Recreated entire project using <https://github.com/rubocop/rubocop-extension-generator>
- Added `EnsureRedirect`

## 0.0.2 (2020-09-24)

- Added `RubyVersionFile`: Ensure we read Gemfile ruby version from `.ruby-version` file

## 0.0.1 (2019-09-11)

- Forked from gitlab-security
- Added `CommandLiteralInjection`: Passing user input to `` and %x without sanitization and parameterization can result in command injection)
