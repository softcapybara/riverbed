# frozen_string_literal: true

module Riverbed
  class Step
    def initialize(flow_data, logger)
      @flow_data = flow_data
      @logger = logger
    end

    def skip?
      false
    end

    def break_flow?
      false
    end

    def execute
      raise NotImplementedError
    end

    def name
      self.class.name
    end

    def log_error(err)
      @error = err
    end

    private

    attr_accessor :flow_data, :logger, :error
  end
end
