# frozen_string_literal: true

module Riverbed
  class Flow
    def initialize(input, options)
      @logger = options.fetch(:logger, Logger.new($stdout))
      @log_id = options.fetch(:log_id, generate_log_id)

      @data = options.fetch(:data_object, Riverbed::Data.new(input))
    end

    def self.run(input = nil, options = {})
      new(input, options).run
    end

    def steps
      raise NotImplementedError
    end

    def always
      []
    end

    def run
      log_flow_start

      begin
        run_steps(steps)
      rescue StandardError => e
        on_error(e)
        data.add_error(e)
      end

      run_steps(always)
      log_flow_end

      data.last_result
    end

    private

    attr_accessor :logger, :data, :log_id

    def run_steps(steps)
      steps.each do |step_class|
        step = step_class.new(data, logger)
        next if step.skip?

        log_execution(step.name) do
          data.add_result(step.name, step.execute)
        end

        break if step.break_flow?
      end
    end

    def log_execution(step_name)
      start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      yield
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      logger&.info("#{log_id} Step #{step_name} executed in #{((end_time - start_time) * 1000).round(2)} ms")
    end

    def generate_log_id
      SecureRandom.urlsafe_base64(8)
    end

    def log_flow_start
      logger&.info("#{log_id} Starting flow #{self.class}")
    end

    def log_flow_end
      logger&.info("#{log_id} Ending flow #{self.class}")
    end

    def on_error(error)
      logger&.error(error)
    end
  end
end
