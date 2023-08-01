# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Can Delete a Tool' do
  describe 'DELETE /api/v1/users/:id/tools/:id' do
    it 'deletes a tool' do
      tool = create(:tool, user_id: 1, borrower_id: nil)

      delete "/api/v1/users/1/tools/#{tool.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Tool.count).to eq(0)
    end
  end
end
