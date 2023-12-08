require "rails_helper"

RSpec.describe "Find Parks", type: :feature do 
  describe "Form submitted" do 
    it "displays TN parks" do 
      # As a user,
      # When I select "Tennessee" from the form,
      # (Note: use the existing form)
      # And click on "Find Parks",
      # I see the total of parks found,
      # And for each park I see:
      # - full name of the park
      # - description
      # - direction info
      # - standard hours for operation

      #webmock stub
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

         
      visit root_path
      select "Tennessee", from: :state
      click_button "Find Parks"
      expect(current_path).to eq("/parks")
      expect(page).to have_content("Total number of parks: 15")
    end
  end
end