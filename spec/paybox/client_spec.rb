RSpec.describe PayboxApi::Client do
  it 'initialize without error' do
    expect { PayboxApi::Client.new merchant_id: 123456 }.not_to raise_error 
  end
  
  it 'init_payment without error' do
    client = PayboxApi::Client.new merchant_id: 123456
    expect { client.init_payment }.not_to raise_error 
  end
end
