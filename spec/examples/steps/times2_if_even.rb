# frozen_string_literal: true

class Times2IfEven < Riverbed::Step
  def skip?
    flow_data.last_result.odd?
  end

  def execute
    flow_data.last_result * 2
  end
end
