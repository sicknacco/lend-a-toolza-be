# frozen_string_literal: true

# spec/requests/api/v1/chat_service_spec.rb
require 'rails_helper'

RSpec.describe 'ChatService API', type: :request do
  describe 'GET /api/v1/chat_request', :vcr do
    it 'returns a list of tools for a project' do
      project = 'a deck'
      get "/api/v1/chat_request?project=#{project}"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body, symbolize_names: true)).to eq({ tools: ["1. Hammer", "2. Nails", "3. Screws", "4. Drill", "5. Tape Measure", "6. Safety Glasses", "7. Circular Saw", "8. Level", "9. Post Hole Digger", "10. Shovel", "11. Chalk Line", "12. Work Gloves", "13. Lumber (2x4s, 4x4s, deck boards, etc.)", "14. Deck Fasteners (joist hangers, lag screws, etc.)", "15. Deck Stain or Sealer"]})
    end
  end
end
