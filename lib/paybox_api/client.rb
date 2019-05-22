class PayboxApi::Client
  def initialize(merchant_id:)
    @merchant_id = merchant_id
  end

  def init_payment
    url = URI.parse "https://api.paybox.money/init_payment.php?pg_merchant_id=#{@merchant_id}"
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(url.to_s)
    res = http.request(req)
    res.body
  end
end
