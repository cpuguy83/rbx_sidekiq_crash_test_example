namespace :sidekiq do
  task :start do
    %x[ bundle exec sidekiq -c 50 ]
  end

  task :queue_jobs => :environment do
    1000.times do { TestWorker.perform_async }
  end
end
