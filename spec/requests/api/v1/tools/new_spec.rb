require 'rails_helper'

RSpec.describe 'User can add a Tool', type: :request do
  describe 'POST /api/v1/users/:id/tools' do
    it 'creates a new tool' do

      tool_attributes = {
        name: 'Hammer',
        description: 'A tool to hammer nails',
        image: 'https://images-na.ssl-images-amazon.com/images/I/71%2B9WzB%2BQHL._AC_SL1500_.jpg',
        status: 'Available',
        address: '1234 Tool Lane, Denver, CO',
        user_id: 1,
        borrower_id: nil
      }
     
      post '/api/v1/users/1/tools', params: {tool: tool_attributes }

      expect(response).to be_successful
      expect(response.status).to eq(201)

    end
  end
end