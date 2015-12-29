module Buildable
  def perform(payload_data)
    payload = Payload.new(payload_data)

    UpdateRepoStatus.new(payload).run
    build_runner = BuildRunner.new(payload)
    build_runner.run
  # rescue Resque::TermException
  #   Resque.enqueue(self, payload_data)
  end

  def after_retry_exhausted
    payload = Payload.new(*arguments)
    build_runner = BuildRunner.new(payload)
    build_runner.set_internal_error
  end
end
