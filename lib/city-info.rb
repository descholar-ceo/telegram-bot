require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

# To get my_city info
class CityInfo
  @my_city = nil

  def initialize
    @my_city = read_city
  end

  def read_city
    url = 'https://gist.githubusercontent.com/Miserlou/c5cd8364bf9b2420bb29/raw/2bf258763cdddd704f8ffd3ea9a3e81d25e2c6f6/cities.json'
    res = Net::HTTP.get(URI(url))
    res = JSON.parse(res)
    res
  end

  def select_random
    @my_city = @my_city.sample
    @my_city
  end
end
