# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Can Edit a Tool' do
  describe 'PATCH /api/v1/users/:id/tools/:id' do
    it 'updates a tool status to borrowed' do
      tool = create(:tool, user_id: 1, borrower_id: nil)

      patch "/api/v1/users/1/tools/#{tool.id}", params: { tool: { status: 'Borrowed', borrower_id: 2 } }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      tool.reload

      expect(tool.status).to eq('Borrowed')
      expect(tool.borrower_id).to eq(2)
    end
  end
end
