Rails.application.configure do
  config.session_store :redis_store, expire_after: 90.minutes, servers: {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'],
    db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'],
    namespace: 'session',
  },
  key: "_#{Rails.application.class.module_parent_name.downcase}_session"
end
