require 'telegram/bot'
require_relative 'lookup'
require_relative 'formatter'
require_relative 'constants'

# Bot class
class Bot
  def initialize
    Telegram::Bot::Client.run(Configs::BASE_API_KEY) do |bot|
      bot.listen do |message|
        cases(message, bot)
      end
    end
  end

  private

  def cases(message, bot)
    case message.text.downcase
    when 'start'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::WELCOME_MSG)
    when 'help'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::HELP_MESSAGE)
    else
      other_cases(message, bot)
    end
  end

  def other_cases(message, bot)
    case message.text.downcase
    when 'quote'
      quote_obj = LookUp.new(Configs::PROGRAMMING_QUOTE_API)
      bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response('quote', quote_obj.read).to_s)
    when 'word'
      word_obj = LookUp.new(Configs::WORD_OF_DAY_API)
      bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response('word', word_obj.read).to_s)
    when 'time'
      date_time = Time.new
      puts date_time
      bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response(
        'time', nil, message.from.first_name, message.from.last_name, date_time
      ))
    when 'date'
      date_time = Time.new
      puts date_time
      bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response(
        'date', nil, message.from.first_name, message.from.last_name, date_time
      ))
    else
      bot.api.send_message(chat_id: message.chat.id, text: Messages::BAD_COMMAND)
    end
  end
end
