require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords_form
    # Nothing to do here.
    render("geocoding/street_to_coords_form.html.erb")
  end

  def street_to_coords
    @street_address = params[:user_street_address]

    ##first split the street address

    street_address_split = @street_address.split

street_address_with_notation = @street_address.gsub(" ","+")

api_url_specific = "http://maps.googleapis.com/maps/api/geocode/json?address=#{street_address_with_notation}"

parsed_data = JSON.parse(open(api_url_specific).read)

latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================



    @latitude = latitude

    @longitude = longitude

    render("geocoding/street_to_coords.html.erb")
  end
end
