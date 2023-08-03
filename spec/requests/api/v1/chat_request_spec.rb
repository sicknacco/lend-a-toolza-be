# frozen_string_literal: true

# spec/requests/api/v1/chat_service_spec.rb
require 'rails_helper'

RSpec.describe 'ChatService API', type: :request do
  describe 'GET /api/v1/chat_request', :vcr do
    it 'returns a list of tools for a project' do
      project = 'a deck'
      get "/api/v1/chat_request?project=#{project}"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body, symbolize_names: true)).to eq({ tools: ["1. Hammer", "2. Nails", "3. Drill", "4. Screws", "5. Circular Saw", "6. Tape Measure", "7. Level", "8. Safety Glasses", "9. Work Gloves", "10. Post Hole Digger", "11. Shovel", "12. Chalk Line", "13. Paintbrush", "14. Paint Roller", "15. Deck Boards", "16. Joist Hangers", "17. Deck Railings", "18. Deck Spindles", "19. Deck Posts", "20. Deck Stair Stringers"
      ]})
    end
  end
end
