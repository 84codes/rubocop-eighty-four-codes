# Changelog

## 0.1.2 (2019-09-11)

- `CommandLiteralInjection`: Passing user input to `` and %x without sanitization and parameterization can result in command injection)

## 0.1.0 (2017-08-24)

- `PublicSend`: Check for `__send__` calls. (!5)
- `PublicSend`: Correct checking for calls with and without arguments. (!5)
- Add `JsonSerialization` cop to check for `to_json` or `as_json` without explicit
  whitelisting. (!6)
