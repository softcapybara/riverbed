# frozen_string_literal: true

class RaiseIfMultipleOf10 < Riverbed::Step
  def execute
    raise "Multiple of 10" if (flow_data.last_result % 10) == 0

    flow_data.last_result
  end
end
