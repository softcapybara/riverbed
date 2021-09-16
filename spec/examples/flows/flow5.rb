# frozen_string_literal: true

class Flow5 < Riverbed::Flow
  def steps
    [
      ValueOr2,
      Add2
    ]
  end
end
