namespace :sidekiq do
  task :start do
    %x[ bundle exec sidekiq -c 50 ]
  end

  task :queue_jobs => :environment do
    5.times { TestWorker.perform_async }
  end
end
