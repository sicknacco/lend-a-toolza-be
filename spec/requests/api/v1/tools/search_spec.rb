# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tool Search', type: :request do
  describe 'GET /api/v1/tools/search' do
    let!(:tool_in_colorado) { create(:tool, name: 'Hammer', address: 'Denver, CO') }
    let!(:tool_in_california) { create(:tool, name: 'Screwdriver', address: '90210') }

    it 'returns a list of tools that match the search criteria' do
      get '/api/v1/tools/search?name=Hammer&location=Denver,%20CO'

      expect(response).to have_http_status(200)
      expect(response.body).to include(tool_in_colorado.name)
      expect(response.body).to_not include(tool_in_california.name)
    end
  end
end
