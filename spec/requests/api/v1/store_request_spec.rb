# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Store', type: :request do
  describe 'Store search by location radius' do
    it 'returns list of stores', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      get('/api/v1/stores/80202/25', headers:)

      stores = JSON.parse(response.body, symbolize_names: true)

      expect(stores).to be_a Hash
      expect(stores).to have_key :data
      expect(stores[:data]).to be_an Array

      stores[:data].each do |store|
        expect(store).to have_key :id
        expect(store[:id]).to be_a String
        expect(store[:attributes]).to have_key :name
        expect(store[:attributes][:name]).to be_a String
        expect(store[:attributes]).to have_key :formatted_address
        expect(store[:attributes][:formatted_address]).to be_a String
      end
    end
  end
end
