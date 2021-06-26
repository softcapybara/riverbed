# frozen_string_literal: true

class Times2 < Riverbed::Step
  def execute
    flow_data.last_result * 2
  end
end
