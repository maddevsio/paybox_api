require 'net/http'
require 'json'

module PayboxApi
  module V4
    class Client
      def initialize(merchant_id:, secret_key:)
        @merchant_id = merchant_id
        @secret_key = secret_key
      end

      def payments(**params)
        required_keys = [ :order, :amount, :currency, :description, :uuid ]
        unless required_keys.all? { |key| params.key? key }
          raise "Payments method required keys: #{required_keys.join(', ')}"
        end
        uri = URI.parse url
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Post.new(uri.to_s)
        req.basic_auth @merchant_id, @secret_key
        req['X-Idempotency-Key'] = params[:uuid]
        params.except! :uuid
        params[:order] = params[:order].to_s
        params[:expires_at] ||= (DateTime.now + 1.day).to_s
        json = params.to_json
        http.request(req, json).body
      end

      private

      def url
        'https://api.paybox.money/v4/payments'
      end
    end
  end
end
