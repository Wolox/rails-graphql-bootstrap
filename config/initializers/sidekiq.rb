url = "redis://#{ENV.fetch('REDIS_HOST', '127.0.0.1')}:6379"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end

Sidekiq.default_worker_options = { 'backtrace' => 20 }
