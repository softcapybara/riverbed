# frozen_string_literal: true

class Flow1 < Riverbed::Flow
  def steps
    [
      Add2,
      Times2IfEven,
      Times2,
      Add1
    ]
  end
end
