class ParksFacade
  #init
  def initialize
    @service = ParkService.new
  end

  #parks_per_state
  def parks_per_state(state_code)
    response = @service.parks_per_state(state_code)
    #want to return ruby objects
    data = JSON.parse(response.body, symbolize_names: true)

    #require 'pry'; binding.pry
    #make a Poro
    data[:data].map do |d|
      Park.new(d)
    end
  end
end