require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

url_of_data_we_want = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_address

raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)
# ...

# Let's store the latitude in a variable called 'the_latitude',
#   and the longitude in a variable called 'the_longitude'.

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
puts the_latitude
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
puts the_longitude


puts "The latitude of #{the_address} is #{the_latitude} and the longitude is #{the_longitude}."

the_weather=gets.chomp
url_safe_address = URI.encode(the_address)

url_of_weather_we_want = "https://api.forecast.io/forecast/cc9e23dfdaa96dd75a1e215f3abe04cd/" + the_weather
puts url_of_weather_we_want

puts url_of_weather_we_want

raw_data1 = open(url_of_weather_we_want).read
parsed_data1 = JSON.parse(raw_data1)
puts parsed_data1

the_address
the_temperature



# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
