# frozen_string_literal: true

require 'paybox_api/version'
require 'paybox_api/v4'
require 'paybox_api/spec'

module PayboxApi
  class << self
    def init_client(**config)
      V4::Client.new merchant_id: config[:merchant_id], secret_key: config[:secret_key] unless config[:version]
    end
  end
end
