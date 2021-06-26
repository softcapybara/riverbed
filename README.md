# Riverbed

A business logic ruby gem, initial release, WIP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'riverbed'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install riverbed

## Usage

### Min example:
```ruby
require "riverbed"

class Step1 < Riverbed::Step
  def execute; end
end

class Flow1 < Riverbed::Flow
  def steps
    [
      Step1
    ]
  end
end

Flow1.run
```

### Usage example:

```ruby
require "riverbed"

class Step2 < Riverbed::Step
  def execute
    puts flow_data.input + " world" # flow ipnut

    flow_data.add(:abc, 123) # sets key :abc in flow data container

    10
  end
end

# gets result of previous step (or input if no previous steps exist)
# and adds to value of key abc
# `flow_data.get(:a)` will return nil if key not present, `flow_data.get!(:a)` will raise error if key not preset
class Step3 < Riverbed::Step
  def execute
    flow_data.last_result + flow_data.get(:abc)
  end
end

class Flow2 < Riverbed::Flow
  def steps
    [
      Step2,
      Step3
    ]
  end
end

input = "Hello"
result = Flow2.run(input, options: {}) # can set `options: { logger: nil }` to skip step execution time logging

puts "Final result: #{result}"
```

Check tests for more examples

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/softcapybara/riverbed.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

