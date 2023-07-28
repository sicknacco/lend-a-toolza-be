class LocationService

  def get_location(location)
    get_url("json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  private
  
  def conn 
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/") do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end