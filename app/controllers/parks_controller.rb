class ParksController < ApplicationController
  
  def search
    state_code =  params[:state]
    @facade = ParksFacade.new.parks_per_state(state_code)

    #SERVICE---------------------------------------------------------------

    #faraday connection
    # conn = Faraday.new("https://developer.nps.gov") do |faraday| #base url
    #   faraday.params["api_key"] = Rails.application.credentials.parks[:key]
    # end
    #make api call to endpoint
    # response = conn.get("/api/v1/parks?stateCode=#{state_code}")
    #don't need to include the "api_key=#{key}" because faraday params will find it for us

    #run test here; webmock will have an error message. need to stub request for webmock
    #response = ParkService.new.parks_per_state(state_code)

    #FACADE---------------------------------------------------------------

    #make json data from response
    #@data = JSON.parse(response.body, symbolize_names: true)
    #send back requested information
  end
  
end

# 