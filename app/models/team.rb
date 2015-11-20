class Team

  TEAM_MARKERS = [
    ["38.218676,-92.650764", "Matt"],
    ["32.865568,-117.233887", "Mark"],
    ["39.251506,-119.952592", "Kevin"],
    ["34.037900,-118.273960", "Jake"],
    ["34.247655,-84.433004", "Jennifer"],
    ["41.323350,-72.917515", "David"],
    ["39.724498,-105.012709", "Alec"],
    ["47.568863,-122.106650", "Bernd"],
    ["33.519474,-117.163308", "Ryan"],
    ["38.592866,-90.538222", "Aisha"],
    ["43.361705,-70.514513", "Tom"],
    ["45.679125,-111.031849", "Ryan Wishes He Lived Here"]
  ]

  attr_accessor :reports

  def initialize
    @reports = get_weather_report
  end

  def get_weather_report
    team = []
    TEAM_MARKERS.each do |loc|
      response = Weather.now(loc[0])
      if response.is_a?(Hash)
        long, lat = loc[0].split(",")
        team << OpenStruct.new(
          person: loc[1],
          coords: loc[0],
          summary: response['currently']['summary'],
          temperature: response['currently']['temperature'],
          precip_type: response['currently']['precipType'],
          precip_probability: response['currently']['precipProbability'],
          icon: response['currently']['icon'],
          hourly_summary: response['hourly']['summary'],
          hourly_icon: response['hourly']['icon']
        )
      end
    end
    team
  end

  def geojson
    teamjson = Hash.new
    features = []
    teamjson[:type] = "FeatureCollection"
    teamjson[:features] = features
    TEAM_MARKERS.each do |loc|
      response = Weather.now(loc[0])
      if response.is_a?(Hash)
        coords = loc[0].split(",")
        features << {
            type: "Feature",
            geometry: {
              type: "Point",
              coordinates: [coords[1].to_f, coords[0].to_f] # this part is tricky
            },
            properties: {
              title: loc[1],
              timezone: response['timezone'],
              utc_offset: response['offset'],
              temperature: response['currently']['temperature'],
              summary: response['currently']['summary'],
              temperature: response['currently']['temperature'],
              precip_type: response['currently']['precipType'],
              precip_probability: response['currently']['precipProbability'],
              icon: response['currently']['icon'],
              hourly_summary: response['hourly']['summary'],
              hourly_icon: response['hourly']['icon'],
              :"marker-color" => "#3FAE2A",
              :"marker-symbol" => "marker",
              :"marker-size" => "medium",
            }
          }
      end
    end
    teamjson
  end

end
