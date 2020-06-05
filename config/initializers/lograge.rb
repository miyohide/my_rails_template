Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  # add time to lograge
  config.lograge.custom_options = lambda do |event|
    exceptions = %w(controller action format)
    {
      params: event.payload[:params].except(*exceptions),
      time: Time.now
    }
  end
end
