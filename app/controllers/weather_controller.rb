class WeatherController < ApplicationController

  def index
    @team_weather = Team.new
  end

  def map
    @team_weather = Team.new

    respond_to do |format|
      format.html
      format.json { render json: @team_weather.geojson }  # respond with the created JSON object
    end
  end

end
