Sidekiq.configure_server do |config|
	config.average_scheduled_poll_interval = 2
	config.redis = { url: ENV.fetch('SIDEKIQ_REDIS_URL', 'redis://127.0.0.1:6379/1'), namespace: "app3_sidekiq_#{Rails.env}", id: nil }
end

Sidekiq.configure_client do |config|
	config.average_scheduled_poll_interval = 2
	config.redis = { url: ENV.fetch('SIDEKIQ_REDIS_URL', 'redis://127.0.0.1:6379/1'), namespace: "app3_sidekiq_#{Rails.env}", id: nil }
end
