require_relative 'constants'
# Formatter is in charge of all formatting reponses to user
class Formatter
  def self.format_response(
    res_type, res_object = nil, fname = nil, lname = nil, date_time = nil
  )
    case res_type
    when 'quote'
      "Today\'s Programming quote is:\n\n#{res_object['en']}\n\nAuthor:\t#{res_object['author']}"
    when 'word'
      "Today\'s word of bravity is:\n\n#{res_object['text']}\n\nAuthor:\t#{res_object['author']}"
    when 'date'
      "Hello #{fname} #{lname},\nThe current date is #{date_time.strftime('%a, %B %d, %Y')}"
    when 'time'
      "Hello #{fname} #{lname},\nThe current time is #{date_time.strftime('%I:%M %p')}"
    when 'covid'
      res = res_object['response']
      return Messages::COVID_STATS_NOT_FOUND if res.length.zero?

      general = res[0]
      cases = general['cases']
      format_covid(cases, fname, lname)
    end
  end

  def self.format_covid(general, fname, lname)
    deaths = general['deaths']['total']
    date = general['day']
    continent = general['continent']
    country = general['country']
    population = general['population']
    new_cases = cases['new']
    active_cases = cases['active']
    critical_cases = cases['critical']
    recovered_cases = cases['recovered']
    total_cases = cases['total']
    "Hello #{fname} #{lname}, the following is the statics of Covid-19 in #{country} of #{date}\n
    Continent: #{continent}
    Country: #{country}
    Total population: #{population}
    New cases: #{new_cases}
    Active cases: #{active_cases}
    Critical cases: #{critical_cases}
    Total recovered cases so far: #{recovered_cases}
    Total infected patients so far: #{total_cases}
    Total deaths so far: #{deaths}\n
    That is the update I got you so far.
    I wish you to stay home, and stay safe!"
  end
end
