class ParkService 
  def conn
    conn = Faraday.new("https://developer.nps.gov") do |faraday| #base url
      faraday.params["api_key"] = Rails.application.credentials.parks[:key]
    end
  end

  def parks_per_state(state_code)
    response = conn.get("/api/v1/parks?stateCode=#{state_code}")
  end

end