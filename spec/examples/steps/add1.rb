# frozen_string_literal: true

class Add1 < Riverbed::Step
  def execute
    flow_data.last_result + 1
  end
end
