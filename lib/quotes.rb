require 'telegram/bot'
require 'net/http'
require 'json'

# To get quote info
class Quotes
  @quote = nil

  def initialize
    @quote = read_quote
  end

  def read_quote
    url = 'https://programming-quotes-api.herokuapp.com/quotes/lang/en'
    res = Net::HTTP.get(URI(url))
    res = JSON.parse(res)
    res
  end

  def select_random
    @quote = @quote.sample
    @quote
  end
end
