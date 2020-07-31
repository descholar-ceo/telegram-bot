require_relative '../modules/constants'
# Formatter is in charge of all formatting reponses to user
class Formatter
  def initialiaze; end

  def format_response(
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
      covid_case(res_object, fname, lname)
    end
  end

  private

  def covid_case(res_object, fname, lname)
    res = res_object['response']
    return Messages::COVID_STATS_NOT_FOUND if res.length.zero? or res.nil?

    general = res[0]
    deaths = general['deaths']['total']
    format_covid(general, deaths, fname, lname)
  end

  def format_covid(general, deaths, fname, lname)
    cases = general['cases']
    date = general['day']
    continent = general['continent']
    country = general['country']
    population = general['population']
    new_cases = cases['new']
    active_cases = cases['active']
    critical_cases = cases['critical']
    recovered_cases = cases['recovered']
    total_cases = cases['total']
    "Hello #{fname} #{lname}, the following is the statistics of Covid-19 in #{country} of #{date}\n
    Continent: #{continent}
    Country: #{country}
    Total population: #{population}
    New cases: #{new_cases}
    Active cases: #{active_cases}
    Critical cases: #{critical_cases}
    Total recovered cases so far: #{recovered_cases}
    Total infected patients so far: #{total_cases}
    Total deaths so far: #{deaths}\n\nThat is the update I got you so far.\nI wish you to stay home, and stay safe!"
  end
end
