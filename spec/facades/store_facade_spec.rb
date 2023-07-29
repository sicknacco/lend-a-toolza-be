# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoreFacade, :vcr do
  describe 'instance methods' do
    it '#store_details' do
      stores = StoreFacade.new('80202', 25).stores
      expect(stores).to be_an Array
      expect(stores.first.name).to be_a String
      expect(stores.first.formatted_address).to be_a String
      expect(stores.last.name).to be_a String
      expect(stores.last.formatted_address).to be_a String
    end
  end
end
