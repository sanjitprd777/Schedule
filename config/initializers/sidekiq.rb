Sidekiq.configure_server do |config|
	config.average_scheduled_poll_interval = 2
	config.redis = { url: 'redis://127.0.0.1:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
	config.average_scheduled_poll_interval = 2
	config.redis = { url: 'redis://127.0.0.1:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
end
