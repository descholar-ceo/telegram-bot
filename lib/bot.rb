require 'telegram/bot'
require_relative 'quotes'
require_relative 'word-of-day'

# Bot class
class Bot
  def initialize
    api_key = '1329880993:AAH7I_sHE8zD_cswXoHO0ksSEte0i-upM2s'

    Telegram::Bot::Client.run(api_key) do |bot|
        current_date_time = Time.new
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello! From nezabot')
        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: 'That is the list of help')
        when 'quote'
          my_quote = Quotes.new
          my_quote = my_quote.select_random
          bot.api.send_message(chat_id: message.chat.id, text: my_quote.to_s)
        when 'word'
          my_word = Word.new
          my_word = my_word.select_random
          bot.api.send_message(chat_id: message.chat.id, text: my_word.to_s)
        when 'name'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name}")
        when 'time'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name},\nThe current time is #{current_date_time.strftime('%I:%M %p')}")
        when 'date'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name},\nThe current date is #{current_date_time.strftime('%a, %B %d, %Y')}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry! Invalid input, type /help and hit send for more info')
        end
      end
    end
  end
end
