require 'telegram/bot'
require_relative 'helpers/lookup'
require_relative 'helpers/formatter'
require_relative 'modules/constants'

# Bot class
class Bot < Formatter
  def initialize
    Telegram::Bot::Client.run(Configs::BASE_API_KEY) do |bot|
      bot.listen do |message|
        make_bot_works(message, bot)
      end
    end
  end

  private

  def make_bot_works(message, bot)
    case message.text.downcase
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::WELCOME_MSG)
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::HELP_MESSAGE)
    else
      call_bot_features(message, bot)
    end
  end

  def call_bot_features(message, bot)
    return dealing_with_covid(message, bot) if message.text.downcase.start_with? 'covid'

    case message.text.downcase
    when 'quote'
      quote_obj = LookUp.new(Configs::PROGRAMMING_QUOTE_API)
      bot.api.send_message(chat_id: message.chat.id, text: format_response('quote', quote_obj.read).to_s)
    when 'word'
      word_obj = LookUp.new(Configs::WORD_OF_DAY_API)
      bot.api.send_message(chat_id: message.chat.id, text: format_response('word', word_obj.read).to_s)
    when 'time'
      bot.api.send_message(chat_id: message.chat.id, text: format_response(
        'time', nil, message.from.first_name, message.from.last_name, Time.new
      ))
    when 'date'
      bot.api.send_message(chat_id: message.chat.id, text: format_response(
        'date', nil, message.from.first_name, message.from.last_name, Time.new
      ))
    else
      bot.api.send_message(chat_id: message.chat.id, text: Messages::BAD_COMMAND)
    end
  end

  def dealing_with_covid(message, bot)
    if message.text.downcase == 'covid'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::BAD_COVID_MSG_SENT_COVID_ONLY)
    elsif message.text.downcase.start_with? 'covid/'
      country_arr = message.text.downcase.split '/'
      country = country_arr[1]
      covid_obj = LookUp.new("#{Configs::COVID_API_URL}?country=#{country}", 'covid')
      bot.api.send_message(chat_id: message.chat.id, text: format_response(
        'covid', covid_obj.read, message.from.first_name, message.from.last_name
      ).to_s)
    else
      bot.api.send_message(chat_id: message.chat.id, text: Messages::BAD_COVID_MSG)
    end
  end
end
