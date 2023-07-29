# frozen_string_literal: true

class StoreService
  def get_store(location, radius)
    get_url("textsearch/json?query=hardware%20store%20location=#{location}&radius=#{radius}key=#{ENV['GOOGLE_API_KEY']}")
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/place/') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
