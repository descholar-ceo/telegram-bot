require 'dotenv'

Dotenv.load

module Messages
  BOT_COMMAND_LINE_MSG = "\n\t\t\t\t\t\tHello! This is NezaBot!
  \t\t\t\t\t\t=======================

  I am not a human, I am just a bot. When I am connected, I can receive some commands of users,
  from their telegram accounts, and I look for them an appropriate answer. So far I am able to find the following:

  \n\t\t\t\t=>Programming quote : user has to send me 'quote' as a message
  \n\t\t\t\t=>Word of bravity : user has to send me 'word' as a message
  \n\t\t\t\t=>Current time : user has to send me 'time' as a message
  \n\t\t\t\t=>Current date : user has to send me 'date' as a message
  \n\t\t\t\t=>Covid statistics : send me 'covid/<name_of_country>' replace <name_of_country>
  with the country name you want to read statistics. eg: covid/usa

  If you want me to stop, you can press Ctrl + C (Windows / Linux), or Command + C (MacOS)

  Mugirase Emmanuel (descholar) is my developer,
  you can contact him on emmamugira@gmail.com, for idea, feature request, or bug fix!

  ".freeze
  WELCOME_MSG = "\n\t\t\t\t\t\tHello! This is NezaBot!
  \t\t\t\t================

  I am not a human, I am just a bot. You can send me your request and I will send you a response.
  So far I am able to find the following:

  \n\t\t\t\t=>Programming quote : send me 'quote' as a message
  \n\t\t\t\t=>Word of bravity : send me 'word' as a message
  \n\t\t\t\t=>Current time : send me 'time' as a message
  \n\t\t\t\t=>Current date : send me 'date' as a message
  \n\t\t\t\t=>Covid statistics : send me 'covid/<name_of_country>' replace <name_of_country>
  with the country name you want to read statistics. eg: covid/usa

  I am developed by MUGIRASE Emmanuel, you can contact him on:
  Email: emmamugira@gmail.com
  Twitter: @descholar3".freeze
  HELP_MESSAGE = 'Send me one of the following message, (I call them commands),
  I will reply you with the response specified next to every message:

  1. message : /start    =>  response : Greeting and introduction
  2. message : /help     =>  response : List of all available messages (commands)
  3. message : word     =>  response : Word of bravity of the day
  4. message : quote    =>  response : Today\'s programming quote
  5. message : time     =>  response : To get current time
  6. message : date     =>  response : To get current date
  7. message : covid/<name_of_country   =>  response : To read covid-19 statistics of any country
  "remember to replace <name_of_country> with the country name you want to read its statistics,
  example: covid/usa"
  '.freeze
  BAD_COMMAND = 'Sorry! I am not yet familiar with that term, please send me /help as a message, if you
think that you forgot how to benefit from me!'.freeze
  BAD_COVID_MSG = 'Sorry! If you are looking for covid statistics, use this format: covid/name_of_country'.freeze
  BAD_COVID_MSG_SENT_COVID_ONLY = 'Please tell me the country from which you need to get statistics,
  use this format: covid/name_of_country'.freeze
  COVID_STATS_NOT_FOUND = 'Sorry! It looks like I did not find any statistic about the country you gave me,
  please, make sure that you spelled well the country name and try again,
  remember to use this format: covid/country_name'.freeze
end

module Configs
  BASE_API_KEY = ENV['TELEGRAM_BOT_API_TOKEN']
  PROGRAMMING_QUOTE_API = ENV['PROGRAMMING_QUOTE_API']
  WORD_OF_DAY_API = ENV['WORD_OF_DAY_API']
  COVID_API_HOST = ENV['COVID_API_HOST']
  COVID_API_KEY = ENV['COVID_API_KEY']
  COVID_API_URL = ENV['COVID_API_URL']
end

module TestMockData
  SAMPLE_QUOTE_TO_USER = "Today\'s Programming quote is:\n
Once a new technology starts rolling, if you’re not part of the steamroller, you’re part of the road.
\nAuthor:\tStewart Brand".freeze

  SAMPLE_WORD_TO_USER = "Today\'s word of bravity is:\n
You give before you get.
\nAuthor:\tConfucius".freeze

  SAMPLE_QUOTE_FROM_INTERNET = {
    '_id' => '5a6ce86f2af929789500e83d',
    'en' => 'Once a new technology starts rolling, if you’re not part of the steamroller, you’re part of the road.',
    'author' => 'Stewart Brand', 'rating' => 2.9, 'id' => '5a6ce86f2af929789500e83d'
  }.freeze

  SAMPLE_WORD_FROM_INTERNET = {
    'text' => 'You give before you get.',
    'author' => 'Confucius'
  }.freeze

  SAMPLE_DATE = "Hello neza bot,\nThe current date is Wed, July 29, 2020".freeze
  SAMPLE_TIME = "Hello neza bot,\nThe current time is 10:26 PM".freeze

  SAMPLE_COVID_STATS_FROM_INTERNET =
    { 'get' => 'statistics',
      'parameters' => { 'country' => 'uganda' }, 'errors' => [],
      'results' => 1, 'response' => [{ 'continent' => 'Africa',
                                       'country' => 'Uganda', 'population' => 45_836_124,
                                       'cases' => { 'new' => '+7', 'active' => 117, 'critical' => 0,
                                                    'recovered' => 1028, '1M_pop' => '25', 'total' => 1147 },
                                       'deaths' => { 'new' => nil, '1M_pop' => '0.04', 'total' => 2 },
                                       'tests' => { '1M_pop' => '5822', 'total' => 266_856 },
                                       'day' => '2020-07-30', 'time' => '2020-07-30T12:45:06+00:00' }] }.freeze

  SAMPLE_COVID_STATS_TO_USER = "Hello neza bot, the following is the statistics of Covid-19 in Uganda of 2020-07-30

    Continent: Africa
    Country: Uganda
    Total population: 45836124
    New cases: +7
    Active cases: 117
    Critical cases: 0
    Total recovered cases so far: 1028
    Total infected patients so far: 1147
    Total deaths so far: 2

That is the update I got you so far.
I wish you to stay home, and stay safe!".freeze
end
