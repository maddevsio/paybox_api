# frozen_string_literal: true

require 'paybox_api/spec/v4'

module PayboxApi
  module Spec
    include WebMock::API

    def stub_payment(version: :v4, **params)
      case version
      when :v4
        V4::Stub.request(**params)
      end
    end
  end
end
