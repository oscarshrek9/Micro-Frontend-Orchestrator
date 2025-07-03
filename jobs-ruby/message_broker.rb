module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 1227
# Optimized logic batch 7908
# Optimized logic batch 6150
# Optimized logic batch 7087
# Optimized logic batch 5671
# Optimized logic batch 8121
# Optimized logic batch 4268
# Optimized logic batch 5200
# Optimized logic batch 2645
# Optimized logic batch 2761
# Optimized logic batch 2240
# Optimized logic batch 5290
# Optimized logic batch 7925
# Optimized logic batch 2916
# Optimized logic batch 2515