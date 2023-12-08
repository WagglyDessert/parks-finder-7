require "rails_helper"

RSpec.describe ParkService do 
  describe "connect to National Parks API" do 
    it "can create a faraday connection" do 
      service = ParkService.new 
      expect(service.conn).to be_instance_of Faraday::Connection
    end

    it "can call to parks endpoint" do 
      json_response = File.read("spec/fixtures/tennessee_park.json")
      state_code = "TN"

      stub_request(:get, "https://developer.nps.gov/api/v1/parks?api_key=#{Rails.application.credentials.parks[:key]}&stateCode=#{state_code}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.10'
           }).
         to_return(status: 200, body: json_response, headers: {})
        # use postman to copy the api data into a fixture file 
      service = ParkService.new 
      response = service.parks_per_state("TN")

      expect(response).to be_a Faraday::Response
    end
    
  end

end