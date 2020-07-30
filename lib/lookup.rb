require 'net/http'
require 'json'
require 'uri'
require 'openssl'

# LookUp class in charge of looking up online
class LookUp
  def initialize(url, req_type = nil)
    @res = ''
    @req_type = req_type
    if @req_type == 'covid'
      http = Net::HTTP.new(URI(url).host, URI(url).port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Get.new(URI(url))
      req['x-rapidapi-host'] = 'covid-193.p.rapidapi.com'
      req['x-rapidapi-key'] = 'bb3ebde477msh2bc5f9123f0cc95p1d6922jsn4f0b847ad367'

      @res = http.request(req).read_body
    else
      @res = Net::HTTP.get(URI(url))
    end
  end

  def read
    @req_type == 'covid' ? JSON.parse(@res) : JSON.parse(@res).sample
  end
end
