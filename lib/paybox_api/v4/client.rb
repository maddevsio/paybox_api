# frozen_string_literal: true

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
        check_required_params! params
        uri = URI.parse url
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Post.new(uri.to_s)
        req.basic_auth @merchant_id, @secret_key
        req['X-Idempotency-Key'] = params[:uuid]
        params.reject! { |key| key == :uuid }
        http.request(req, build_json(params)).body
      end

      private

      def url
        'https://api.paybox.money/v4/payments'
      end

      def check_required_params!(params)
        required_keys = %i[order amount currency description uuid expires_at]
        return if required_keys.all? { |key| params.key? key }

        raise "Payments method required keys: #{required_keys.join(', ')}"
      end

      def build_json(params)
        params[:order] = params[:order].to_s
        params.to_json
      end
    end
  end
end
