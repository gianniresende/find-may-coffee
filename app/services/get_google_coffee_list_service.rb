require 'rest-client'
require 'json'
 
class GetGoogleCoffeeListService
    def initialize(latitude, longitude)
      p @latitude = latitude
      p @longitude = longitude
      p @api_key = 'AIzaSyBQaKC3F0Vty2671lSZxgYFmbnNmft4AyQ'
    end
  
    def call
        begin
          p base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{@latitude},#{@longitude}&radius=5000&key=#{@api_key}"
          response = RestClient.get base_url
          JSON.parse(response.body)
        rescue RestClient::ExceptionWithResponse => e
            e.response
        end
    end
end