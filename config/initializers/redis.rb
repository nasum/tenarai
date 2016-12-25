require 'redis'

uri = URI.parse(ENV["REDIS"] ||= 'localhost:6379')
REDIS = Redis.new(host: uri.host, port: uri.port)
