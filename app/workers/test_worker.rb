class TestWorker
  include Sidekiq::Worker

  def perform(a=nil)
    unless a
      10000.times { self.class.perform_async('test') }
    else
      sleep 0.1
    end
  end
end
