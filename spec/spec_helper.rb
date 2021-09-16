# frozen_string_literal: true

require "riverbed"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_relative "examples/flows/empty_flow"
require_relative "examples/flows/flow1"
require_relative "examples/flows/flow2"
require_relative "examples/flows/flow3"
require_relative "examples/flows/flow4"
require_relative "examples/flows/flow5"
require_relative "examples/steps/add1"
require_relative "examples/steps/add2"
require_relative "examples/steps/break_on_odd"
require_relative "examples/steps/raise_if_multiple_of_10"
require_relative "examples/steps/times2"
require_relative "examples/steps/times2_if_even"
require_relative "examples/steps/value_or_2"
