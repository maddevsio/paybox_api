require 'webmock'

module PayboxApi
  module Spec
    module V4
      module Stub
        class << self
          include ::WebMock

          def request
            stub_request(
              :post,
              'https://api.paybox.money/v4/payments'
            ).to_return(status: 200, body: '{}', headers: {})
          end
        end
      end
    end
  end
end
