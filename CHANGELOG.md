## [Unreleased]

## [0.2.0] - 2021-09-24
- Add log_id option to flow
```ruby
Flow.run(nil, { log_id: "abc_my_session_id" })
```

- Change the way in which flow accepts parameters. Now flow options are second parameter.
Old way, no longer accepted:
```ruby
Flow.run(options: { logger: nil })
Flow.run({}, options: { logger: nil })
# Flow.run({}) ## This would raise error
```

New way:
```ruby
Flow.run(nil, { logger: nil })
Flow.run({}, { logger: nil })
# Flow.run(options: { logger: nil }) ## This would land in input instead of options
# Flow.run({}, options: { logger: nil }) ## This would cause code to ignore options
```

## [0.1.0] - 2021-06-26

- Initial release
