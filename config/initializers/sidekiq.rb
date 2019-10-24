url = ENV['REDISCLOUD_URL'] || ENV['REDISTOGO_URL'] ||
      "redis://#{ENV.fetch('REDIS_1_PORT_6379_TCP_ADDR', '127.0.0.1')}:6379"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end

Sidekiq.default_worker_options = { 'backtrace' => 20 }
