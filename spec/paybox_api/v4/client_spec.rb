RSpec.describe PayboxApi::V4::Client do
  it 'initialize without error' do
    expect { PayboxApi::V4::Client.new merchant_id: 123456, secret_key: 123456 }.not_to raise_error 
  end
  
  it 'init_payment without error' do
    client = PayboxApi::V4::Client.new merchant_id: 123456, secret_key: 123456
    expect { client.init_payment }.not_to raise_error 
  end
end
