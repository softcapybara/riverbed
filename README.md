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

### Min working example:
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

# uses flow input to print "Hello world"
# stores data in flow_data - object available in all steps for storing and retreiving data
# returns 10, which can be accessed in next step through `last_result` method called on flow_data
class Step2 < Riverbed::Step
  def execute
    puts flow_data.input + " world"

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
result = Flow2.run(input)
# Flow2.run(input, { logger: nil }) - second parameter is for options
# available options:
# `logger: nil` to skip step execution time logging
# `log_id: "abc"` sets log_id displayed when logging flow progress
# `data_object: Riverbed::Data.new(my: :data)` if you want to use existing data object, eg. from previous flow

puts "Final result: #{result}"
```
### Options
To run example flow with options:
`Flow2.run(input, { logger: nil })` - second parameter is for options
Available options:
- `logger: nil` to skip logging
- `log_id: "abc"` sets log_id displayed when logging flow progress
- `data_object: Riverbed::Data.new(my: :data)` if you want to use existing data object, eg. from previous flow.

### Available Flow Data methods
#### Add to data container:
`flow_data.add(:abc, 123)`
#### Get value from data container:
`flow_data.get(:abc)`
`flow_data.get!(:abc)` # raises error if value is not set
#### Get flow input value from data container:
`flow_data.input`
#### Get result of last step from data container:
`flow_data.last_result`

Check tests for more examples

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/softcapybara/riverbed.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

