class PayboxApi::Client
  def initialize(merchant_id:)
    @merchant_id = merchant_id
  end

  def init_payment
    url = URI.parse "https://api.paybox.money/init_payment.php?pg_merchant_id=#{@merchant_id}"
    req = Net::HTTP::Post.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    puts res.body
  end
end
