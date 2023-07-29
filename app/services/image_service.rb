# frozen_string_literal: true

class ImageService
  def get_image(tool)
    get_url("search/photos?query=#{tool}")
  end

  private

  def conn
    Faraday.new(url: 'https://api.unsplash.com/') do |f|
      f.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
