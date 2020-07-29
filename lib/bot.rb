require 'telegram/bot'
require_relative 'lookup'
require_relative 'formatter'

# Bot class
class Bot
  def initialize
    api_key = '1329880993:AAH7I_sHE8zD_cswXoHO0ksSEte0i-upM2s'

    Telegram::Bot::Client.run(api_key) do |bot|
      bot.listen do |message|
        case message.text.downcase
        when 'start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello! From nezabot')
        when 'help'
          bot.api.send_message(chat_id: message.chat.id, text: 'That is the list of help')
        when 'quote'
          quote_obj = LookUp.new('https://programming-quotes-api.herokuapp.com/quotes/lang/en')
          my_quote = quote_obj.read
          bot.api.send_message( chat_id: message.chat.id, text: "#{Formatter.format_response('quote',my_quote)}")
        when 'word'
          quote_obj = LookUp.new('https://type.fit/api/quotes')
          my_word = quote_obj.read
          bot.api.send_message(chat_id: message.chat.id, text: "#{Formatter.format_response('word',my_word)}")
        when 'time'
          current_date_time = Time.new
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name},\nThe current time is #{current_date_time.strftime('%I:%M %p')}")
        when 'date'
          current_date_time = Time.new
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name},\nThe current date is #{current_date_time.strftime('%a, %B %d, %Y')}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry! Invalid input, type help and hit send for more info')
        end
      end
    end
  end
end
