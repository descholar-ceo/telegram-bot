require 'net/http'
require 'json'

# LookUp class in charge of looking up online
class LookUp
  def initialize(url)
    @res = Net::HTTP.get(URI(url))
  end

  def read
    JSON.parse(@res).sample
  end
end
