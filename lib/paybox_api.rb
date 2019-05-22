require 'paybox_api/version'
require 'paybox_api/client'
require 'net/http'

module PayboxApi
  class << self
    def init_client(**config)
      Client.new merchant_id: config[:merchant_id], secret_key: config[:secret_key]
    end
  end
end
