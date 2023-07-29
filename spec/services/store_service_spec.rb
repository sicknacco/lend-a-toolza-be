# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoreService do
  describe 'instance methods' do
    it '#get_location', :vcr do
      location = '80202'
      store_service = StoreService.new.get_store(location, 25)

      expect(store_service).to be_a Hash
      expect(store_service[:results]).to be_an Array
      expect(store_service[:results].first).to be_a Hash
      expect(store_service[:results].first[:name]).to be_a String
      expect(store_service[:results].first[:formatted_address]).to be_a String
      expect(store_service[:results].first[:opening_hours][:open_now]).to be_in([true, false])
    end
  end
end
