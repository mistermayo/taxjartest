require "rails_helper"

RSpec.describe WeatherController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "http://localhost:3000").to route_to("weather#index")
    end
    it "routes to #map" do
     expect(:get => "http://localhost:3000/map").to route_to("weather#map")
   end
 end
end
