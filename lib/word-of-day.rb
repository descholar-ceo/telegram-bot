require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

# To get word info
class Word
  @word = nil

  def initialize
    @word = read_word
  end

  def read_word
    url = 'https://type.fit/api/quotes'
    res = Net::HTTP.get(URI(url))
    res = JSON.parse(res)
    res
  end

  def select_random
    @word = @word.sample
    @word
  end
end
