require "rails_helper"

RSpec.describe WeatherController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/weather").to route_to("weather#index")
    end

    it "routes to #map" do
     expect(:get => "/weather/map").to route_to("weather#map")
   end
 end
end
