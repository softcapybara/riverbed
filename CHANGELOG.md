## [Unreleased]

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
