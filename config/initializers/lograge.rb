Rails.application.configure do
  config.lograge.enabled = true

  # add time to lograge
  config.lograge.custom_options = lambda do |e|
    { time: Time.now }
  end
end
