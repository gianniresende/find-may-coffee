require 'rest-client'
require 'json'
 
class GetGoogleCoffeeDetailsService

  def initialize(place_id)
    @place_id = place_id
    @api_key = 'AIzaSyDX4bWoFiltWgD0uH4HiQHNgADVk90oFck'
  end
  
  def call
    begin
        base_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@place_id}&key=#{@api_key}"
        response = RestClient.get base_url
        value = JSON.parse(response.body)
    
    rescue RestClient::ExceptionWithResponse => e
        e.response
    end
  end
  
end