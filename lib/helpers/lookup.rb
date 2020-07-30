require 'net/http'
require 'json'
require 'uri'
require 'openssl'
require_relative '../modules/constants'

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
      req['x-rapidapi-host'] = Configs::COVID_API_HOST
      req['x-rapidapi-key'] = Configs::COVID_API_KEY

      @res = http.request(req).read_body
    else
      @res = Net::HTTP.get(URI(url))
    end
  end

  def read
    @req_type == 'covid' ? JSON.parse(@res) : JSON.parse(@res).sample
  end
end
