# frozen_string_literal: true

module Riverbed
  class Data
    attr_reader :input

    def initialize(input)
      @input = input
      @results = []
      @executed_steps = []
      @registered = {}
      @errors ||= []
    end

    def add_result(step_name, result)
      executed_steps << step_name
      results << result
    end

    def last_result
      if results.empty?
        @input
      else
        results.last
      end
    end

    def add(name, value)
      registered[name] = value
    end

    def get(name)
      registered[name]
    end

    def get!(name)
      registered.fetch(name)
    end

    def add_error(err)
      @errors << err
    end

    def last_error
      @errors.last
    end

    private

    attr_accessor :results, :registered, :executed_steps, :errors
  end
end
