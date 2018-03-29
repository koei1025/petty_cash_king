class TestWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  sidekiq_retries_exhausted do |msg, _e|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end

  def perform(*args)
    sleep_time = args[0][1]
    puts "JID=========>#{jid}"
    # determine_job_status_by_self(jid)
  rescue => ex
    puts "TestWorker exception=====>#{ex.message}"
    # record_worker_log(jid, 'E',ex.class , ex.message)
    # determine_job_status_by_self(jid)
  end
end