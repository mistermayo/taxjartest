class Weather
  include HTTParty
  debug_output
  base_uri "https://api.forecast.io/forecast\/#{ENV['FORECAST_API_TOKEN']}"
  headers 'Content-Type' => 'application/json'

  def self.now(gps_coords)
    Rails.cache.fetch("weather:#{gps_coords}", :expires_in => 2.hours) do
      response = get("\/#{gps_coords}")
      response.parsed_response
    end
  end

end
