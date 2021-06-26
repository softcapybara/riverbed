# frozen_string_literal: true

class BreakOnOdd < Riverbed::Step
  def execute
    flow_data.last_result
  end

  def break_flow?
    flow_data.last_result.odd?
  end
end
