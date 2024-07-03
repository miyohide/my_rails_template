class JsonLogFormatter < ::Logger::Formatter
  def call(severity, time, progname, msg)
    {
      severity: severity,
      time: time.utc.iso8601,
      progname: progname,
      message: msg
    }.to_json + "\n"
  end
end
