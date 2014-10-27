require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

url_of_weather_we_want = "https://api.forecast.io/forecast/cc9e23dfdaa96dd75a1e215f3abe04cd/#{the_latitude},#{the_longitude}"


raw_data1 = open(url_of_weather_we_want).read
parsed_data1 = JSON.parse(raw_data1)

the_temperature = parsed_data1["currently"]["temperature"]
the_hour_outlook = parsed_data1["hourly"]["summary"]
the_day_outlook = parsed_data1["daily"]["summary"]

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"


