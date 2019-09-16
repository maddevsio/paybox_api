# PayboxApi [https://camo.githubusercontent.com/f9860acbe6f13b42b3093d485a115cfa6feae8eb/68747470733a2f2f6d6164646576732e696f2f62616467652d6461726b2e737667](https://maddevs.io) [![Build Status](https://travis-ci.org/maddevsio/paybox_api.svg?branch=master)](https://travis-ci.org/maddevsio/paybox_api) [![Gem Version](https://badge.fury.io/rb/paybox_api.svg)](https://badge.fury.io/rb/paybox_api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paybox_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paybox_api

## Usage

```ruby
# config/secrets.yml

development:
  paybox:
    merchant_id: YOUR_MERCHANT_ID
    secret_key: YOUR_SECRET_KEY

# app/controllers/application_controller.rb

include PayboxService

def paybox_client
  PayboxApi.init_client(**Rails.application.secrets.paybox)
end

# using

paybox_client.payments order: uniq_order_id,
  amount: amount,
  currency: 'RUB',
  description: description,
  uuid: payment_uuid,
  options: {
    callbacks: {
      success_url: success_url,
      failure_url: failure_url
    },
    user: {
      email: user.email
    }
  }
```

## Stub payment request

```ruby
# RSpec

before { stub_payment }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maddevsio/paybox_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
