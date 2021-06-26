# frozen_string_literal: true

class Flow3 < Riverbed::Flow
  def steps
    [
      Add2
    ]
  end

  def always
    [
      Times2
    ]
  end
end
