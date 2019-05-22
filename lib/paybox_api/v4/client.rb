require 'net/http'
require 'json'

module PayboxApi
  module V4
    class Client
      def initialize(merchant_id:, secret_key:)
        @merchant_id = merchant_id
        @secret_key = secret_key
      end

      def init_payment(**params)
        puts url
        uri = URI.parse url
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Post.new(uri.to_s)
        req['Merchant ID'] = @merchant_id
        req['Secret Key'] = @secret_key
        req['X-Idempotency-Key'] = params[:uuid]
        json = params.to_json
        res = http.request req, json
        puts json
        puts res.body
        res.body
      end

      private

      def url
        'https://api.paybox.money/v4/payments'
      end
    end
  end
end
