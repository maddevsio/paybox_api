class PayboxApi::Client
  def initialize(merchant_id:, secret_key:)
    @merchant_id = merchant_id
    @secret_key = secret_key
  end

  def sig(script_name, **fields)
    components = [ script_name ]
    components = fields.keys.sort.reduce(components) do |arr, key|
      arr << fields[key]
    end
    components << @secret_key
    Digest::MD5.hexdigest components.join ';'
  end

  def xml(params)
      params.reduce({}) do |hash, pair|
        hash.merge! "pg_#{pair[0]}" => pair[1]
      end.to_xml root: :request, skip_types: true, dasherize: false
  end

  def init_payment(**params)
    params[:merchant_id] = @merchant_id
    params[:salt] = SecureRandom.hex
    params[:sig] = sig :init_payment, params
    builded_url = url
    puts builded_url
    uri = URI.parse builded_url
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.to_s)
    res = http.request(req, xml(params))
    puts xml params
    puts res.body
    res.body
  end

  private

  def url
    "https://api.paybox.money/init_payment.php"
  end
end
