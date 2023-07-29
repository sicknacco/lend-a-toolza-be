# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageService, :vcr do
  describe 'instance methods' do
    it '#get_image' do
      image_service = ImageService.new
      tool = 'drill'
      image = image_service.get_image(tool)

      expect(image).to be_a Hash
      expect(image).to have_key(:results)
      expect(image[:results]).to be_an Array

      image[:results].each do |result|
        expect(result).to have_key(:urls)
        expect(result[:urls]).to have_key(:small)
        expect(result[:urls][:small]).to be_a String
      end
    end
  end
end
