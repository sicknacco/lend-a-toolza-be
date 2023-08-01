# frozen_string_literal: true

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

      post '/api/v1/users/1/tools', params: { tool: tool_attributes }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(response.body).to include('Hammer')
      expect(response.body).to include('A tool to hammer nails')
      expect(response.body).to include('https://images-na.ssl-images-amazon.com/images/I/71%2B9WzB%2BQHL._AC_SL1500_.jpg')
      expect(response.body).to include('Available')
      expect(response.body).to include('1234 Tool Lane, Denver, CO')
      expect(response.body).to include('1')
      expect(response.body).to include('null')
    end

    it "returns an error if a tool can't be created" do
      tool_attributes = {
        name: '',
        description: 'A tool to hammer nails',
        image: 'https://images-na.ssl-images-amazon.com/images/I/71%2B9WzB%2BQHL._AC_SL1500_.jpg',
        status: 'Available',
        address: '1234 Tool Lane, Denver, CO',
        user_id: 1,
        borrower_id: nil
      }

      post '/api/v1/users/1/tools', params: { tool: tool_attributes }

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    end
  end
end
