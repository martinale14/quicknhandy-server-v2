require "redis"
require "redis/objects"
require "connection_pool"

redis_cfg = { host: "127.0.0.1", port: 6379, db: 0 }

Redis::Objects.redis = ConnectionPool.new(size: 5, timeout: 5) do
  Redis.new(redis_cfg)
end
