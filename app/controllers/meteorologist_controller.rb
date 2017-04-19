require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    ##first create the syntax needed for the street address to be read by the api
    street_address_with_notation = @street_address.gsub(" ","+")

    ##now create a string for the relevant API's URL with the address appended on

    api_url_specific_lat_lng = "http://maps.googleapis.com/maps/api/geocode/json?address=#{street_address_with_notation}"

    ##read the data into the API
    parsed_data_lat_lng = JSON.parse(open(api_url_specific_lat_lng).read)

    ##find the latitude
    @latitude = parsed_data_lat_lng["results"][0]["geometry"]["location"]["lat"]

    ##find the longitude
    @longitude = parsed_data_lat_lng["results"][0]["geometry"]["location"]["lng"]

    ##use the newly found latitude and longitude to create the string for the weather API

    api_url_specific_weather = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude}"

    ##parse the weather API

    parsed_data_weather = JSON.parse(open(api_url_specific_weather).read)

    ###DAY 1

    ##capture the time stamp for today + 1

    seconds_per_day = 24 * 60 * 60

    @time_1 = (Time.now.to_i + seconds_per_day)

    @date_1 = (Date.today + 1)

    api_url_specific_weather_forecast_1_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_1}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_1_day = JSON.parse(open(api_url_specific_weather_forecast_1_day).read)

    ###############DAY 2

    ##capture the time stamp for today + 2

    @time_2 = (Time.now.to_i + seconds_per_day*2)

    @date_2 = (Date.today + 2)

    api_url_specific_weather_forecast_2_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_2}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_2_day = JSON.parse(open(api_url_specific_weather_forecast_2_day).read)

    ###############DAY 3

    ##capture the time stamp for today + 3

    @time_3 = (Time.now.to_i + seconds_per_day*3)

    @date_3 = (Date.today + 3)

    api_url_specific_weather_forecast_3_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_3}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_3_day = JSON.parse(open(api_url_specific_weather_forecast_3_day).read)

    ###############DAY 4

    ##capture the time stamp for today + 4

    @time_4 = (Time.now.to_i + seconds_per_day*4)

    @date_4 = (Date.today + 4)

    api_url_specific_weather_forecast_4_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_4}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_4_day = JSON.parse(open(api_url_specific_weather_forecast_4_day).read)

    ###############DAY 5

    ##capture the time stamp for today + 5

    @time_5 = (Time.now.to_i + seconds_per_day*5)

    @date_5 = (Date.today + 5)

    api_url_specific_weather_forecast_5_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_5}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_5_day = JSON.parse(open(api_url_specific_weather_forecast_5_day).read)

    ###############DAY 6

    ##capture the time stamp for today + 6

    @time_6 = (Time.now.to_i + seconds_per_day*6)

    @date_6 = (Date.today + 6)

    api_url_specific_weather_forecast_6_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_6}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_6_day = JSON.parse(open(api_url_specific_weather_forecast_6_day).read)

    ###############DAY 7

    ##capture the time stamp for today + 7

    @time_7 = (Time.now.to_i + seconds_per_day*7)

    @date_7 = (Date.today + 7)

    api_url_specific_weather_forecast_7_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_7}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_7_day = JSON.parse(open(api_url_specific_weather_forecast_7_day).read)

    ###############DAY 8

    ##capture the time stamp for today + 8

    @time_8 = (Time.now.to_i + seconds_per_day*8)

    @date_8 = (Date.today + 8)

    api_url_specific_weather_forecast_8_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_8}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_8_day = JSON.parse(open(api_url_specific_weather_forecast_8_day).read)

    ###############DAY 9

    ##capture the time stamp for today + 9

    @time_9 = (Time.now.to_i + seconds_per_day*9)

    @date_9 = (Date.today + 9)

    api_url_specific_weather_forecast_9_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_9}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_9_day = JSON.parse(open(api_url_specific_weather_forecast_9_day).read)

    ###############DAY 10

    ##capture the time stamp for today + 10

    @time_10 = (Time.now.to_i + seconds_per_day*10)

    @date_10 = (Date.today + 10)

    api_url_specific_weather_forecast_10_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_10}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_10_day = JSON.parse(open(api_url_specific_weather_forecast_10_day).read)

    ###############DAY 11

    ##capture the time stamp for today + 11

    @time_11 = (Time.now.to_i + seconds_per_day*11)

    @date_11 = (Date.today + 11)

    api_url_specific_weather_forecast_11_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_11}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_11_day = JSON.parse(open(api_url_specific_weather_forecast_11_day).read)

    ###############DAY 12

    ##capture the time stamp for today + 12

    @time_12 = (Time.now.to_i + seconds_per_day*12)

    @date_12 = (Date.today + 12)

    api_url_specific_weather_forecast_12_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_12}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_12_day = JSON.parse(open(api_url_specific_weather_forecast_12_day).read)

    ###############DAY 13

    ##capture the time stamp for today + 13

    @time_13 = (Time.now.to_i + seconds_per_day*13)

    @date_13 = (Date.today + 13)

    api_url_specific_weather_forecast_13_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_13}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_13_day = JSON.parse(open(api_url_specific_weather_forecast_13_day).read)

    ###############DAY 14

    ##capture the time stamp for today + 14

    @time_14 = (Time.now.to_i + seconds_per_day*14)

    @date_14 = (Date.today + 14)

    api_url_specific_weather_forecast_14_day = "https://api.darksky.net/forecast/a56bb3edd56b95d3e5d3d6ff6645f968/#{@latitude},#{@longitude},#{@time_14}?exclude=minutely,hourly, daily,alerts,flags"

    parsed_data_weather_14_day = JSON.parse(open(api_url_specific_weather_forecast_14_day).read)

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================



    @current_temperature = parsed_data_weather["currently"]["temperature"]

    @current_summary = parsed_data_weather["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data_weather["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data_weather["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data_weather["daily"]["summary"]

    @summary_of_day_plus_1 = parsed_data_weather_1_day["currently"]["summary"]

    @summary_of_day_plus_2 = parsed_data_weather_2_day["currently"]["summary"]

    @summary_of_day_plus_3 = parsed_data_weather_3_day["currently"]["summary"]

    @summary_of_day_plus_4 = parsed_data_weather_4_day["currently"]["summary"]

    @summary_of_day_plus_5 = parsed_data_weather_5_day["currently"]["summary"]

    @summary_of_day_plus_6 = parsed_data_weather_6_day["currently"]["summary"]

    @summary_of_day_plus_7 = parsed_data_weather_7_day["currently"]["summary"]

    @summary_of_day_plus_8 = parsed_data_weather_8_day["currently"]["summary"]

    @summary_of_day_plus_9 = parsed_data_weather_9_day["currently"]["summary"]

    @summary_of_day_plus_10 = parsed_data_weather_10_day["currently"]["summary"]

    @summary_of_day_plus_11 = parsed_data_weather_11_day["currently"]["summary"]

    @summary_of_day_plus_12 = parsed_data_weather_12_day["currently"]["summary"]

    @summary_of_day_plus_13 = parsed_data_weather_13_day["currently"]["summary"]

    @summary_of_day_plus_14 = parsed_data_weather_14_day["currently"]["summary"]

    render("meteorologist/street_to_weather.html.erb")
  end
end
