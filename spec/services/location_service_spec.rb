require 'rails_helper'  

RSpec.describe LocationService do
  describe 'instance methods' do
    it 'get_location', :vcr do
      location = "denver,co"
      location_result = LocationService.new.get_location(location)

      expect(location_result).to be_a(Hash)
      expect(location_result).to have_key(:results)
      expect(location_result[:results]).to be_an(Array)
     
      location_result[:results].each do |result|
        expect(result).to have_key(:geometry)
        expect(result[:geometry]).to have_key(:location)
        expect(result[:geometry][:location]).to have_key(:lat)
        expect(result[:geometry][:location]).to have_key(:lng)
      end
    end
  end
end