require 'rails_helper'

RSpec.describe 'Users Tools', type: :request do
  describe 'GET /api/v1/users/:id/tools' do
    it 'returns all tools for a user' do
      create_list(:tool, 5, user_id: 1, borrower_id: nil)
      get '/api/v1/users/1/tools'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user_tools = JSON.parse(response.body, symbolize_names: true)
      user_tools[:data].each do |tool|
        expect(tool[:attributes][:user_id]).to eq(1)
        expect(tool[:attributes][:name]).to be_a(String)
        expect(tool[:attributes][:description]).to be_a(String)
        expect(tool[:attributes][:image]).to be_a(String)
        expect(tool[:attributes][:status]).to be_a(String)
        expect(tool[:attributes][:address]).to be_a(String)
        expect(tool[:attributes][:borrower_id]).to be_a(Integer).or be_nil
      end
    end

    it 'returns all tools that have been borrowed out' do
      create_list(:tool, 5, user_id: 2, borrower_id: 4)
      create_list(:tool, 2, user_id: 4, borrower_id: nil)
      get '/api/v1/users/2/tools'

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include('borrower_id')
      expect(response.body).to_not include('nil')
    end

    it 'returns list of tools borrowed by a user' do
   
    end
  end
end