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

    render("meteorologist/street_to_weather.html.erb")
  end
end
