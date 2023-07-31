# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tool Search', type: :request do
  describe 'GET /api/v1/tools/search' do
    let!(:tool_in_colorado) { create(:tool, name: 'Hammer', address: 'Denver, CO', borrower_id: nil) }
    let!(:tool_in_california) { create(:tool, name: 'Screwdriver', address: '90210', borrower_id: nil) }
    let!(:tool_in_nm) { create(:tool, name: 'Drill Press', address: 'NM, 87501', borrower_id: nil) }

    it 'returns a list of tools by name and state' do
      get '/api/v1/tools/search?name=Hammer&location=Denver,%20CO'

      expect(response).to have_http_status(200)
      expect(response.body).to include(tool_in_colorado.name)
      expect(response.body).to_not include(tool_in_california.name)
    end

    it 'returns a list of tools by name and zip' do
      get '/api/v1/tools/search?name=Screwdriver&location=90210'

      expect(response).to have_http_status(200)
      expect(response.body).to include(tool_in_california.name)
      expect(response.body).to_not include(tool_in_colorado.name)
    end

    it 'returns a list of tools by name, state, and zip' do
      get '/api/v1/tools/search?name=Drill%20Press&location=NM,%2087501'

      expect(response).to have_http_status(200)
      expect(response.body).to include(tool_in_nm.name)
      expect(response.body).to_not include(tool_in_colorado.name)
      expect(response.body).to_not include(tool_in_california.name)
    end

    it 'displays an error message if no tools are found' do
      get '/api/v1/tools/search?name=Jackhammer&location=90210'

      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('No tools found in your area')
      expect(response.body).to_not include('Jackhammer')
    end
  end

  describe 'Single Tool Search' do
    it 'returns a single tool and its attributes' do
      tool = create(:tool, user_id: 1, borrower_id: nil)
      get "/api/v1/tools/search?name=#{tool.name}&location=#{tool.address}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include(tool.name)
      expect(response.body).to include(tool.description)
      expect(response.body).to include(tool.image)
      expect(response.body).to include(tool.status)
      expect(response.body).to include(tool.address)
      expect(response.body).to include(tool.user_id.to_s)
      expect(response.body).to include(tool.borrower_id.to_s)
    end
  end
end
