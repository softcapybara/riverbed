# frozen_string_literal: true

class Add2 < Riverbed::Step
  def execute
    flow_data.last_result + 2
  end
end
