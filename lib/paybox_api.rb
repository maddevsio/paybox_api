require 'paybox_api/version'
require 'paybox_api/client'
require 'net/http'

module PayboxApi
  class << self
    def init_client(**config)
      Client.new merchant_id: config[:merchant_id]
    end
  end
end
