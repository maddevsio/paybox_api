require 'securerandom'

RSpec.describe PayboxApi::V4::Client do
  it 'initialize without error' do
    expect { PayboxApi::V4::Client.new merchant_id: 123456, secret_key: 123456 }.not_to raise_error 
  end
  
  it 'payments without error' do
    client = PayboxApi::V4::Client.new merchant_id: 123456, secret_key: 123456
    expect do
      client.payments order: 1,
        amount: 123,
        currency: 'RUB',
        description: 'Buy Apple inc.',
        uuid: SecureRandom.uuid,
        expires_at: Time.now + (24 * 60 * 60)
    end.not_to raise_error 
  end
end
