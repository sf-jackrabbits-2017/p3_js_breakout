class LocationsController < ApplicationController

  LOCATIONS = {
    "CHI" => ['41.8762221','-87.6553353'],
    "SF" => ['37.7845852','-122.3972145'],
    "NYC" => ['40.706551','-74.009039'],
    "AUS" => ['30.279961','-97.741867'],
    "SEA" => ['47.5979523','-122.3349437'],
    "SD" => ['32.7154026','-117.1580483']
  }

  def location_by_name
    name = params[:name]
    lat = LOCATIONS[name].first
    long= LOCATIONS[name].last
    response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}/#{lat},#{long}")
    @data = response.parsed_response

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @data.to_json }
    end
  end
end