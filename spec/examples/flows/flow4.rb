# frozen_string_literal: true

class Flow4 < Riverbed::Flow
  def steps
    [
      RaiseIfMultipleOf10
    ]
  end

  def always
    [
      Times2
    ]
  end

  def on_error(_error); end
end
