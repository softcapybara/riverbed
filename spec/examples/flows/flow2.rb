# frozen_string_literal: true

class Flow2 < Riverbed::Flow
  def steps
    [
      BreakOnOdd,
      Times2,
      Times2
    ]
  end
end
