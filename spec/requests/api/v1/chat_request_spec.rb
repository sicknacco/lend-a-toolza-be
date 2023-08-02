# frozen_string_literal: true

# spec/requests/api/v1/chat_service_spec.rb
require 'rails_helper'

RSpec.describe 'ChatService API', type: :request do
  describe 'GET /api/v1/chat_request', :vcr do
    it 'returns a list of tools for a project' do
      project = 'a deck'
      get '/api/v1/chat_request', params: { project: project}

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body, symbolize_names: true)).to eq({ tools: ["-Hammer", "-Drill", "-Measuring tape", "-Circular saw", "-Safety glasses", "-Work gloves", "-Level", "-Post hole digger", "-Shovel", "-Screws", "-Nails", "-Deck screws", "-Deck boards", "-Deck railings", "-Deck posts", "-Deck joists", "-Deck footings", "-Deck sealant"
        ]})
    end
  end
end
