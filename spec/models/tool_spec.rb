# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tool, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :status }
    it { should validate_presence_of :address }
    it { should validate_presence_of :user_id }
    it { should allow_value(nil).for(:borrower_id) }
  end

  describe 'class methods' do
    let!(:tool_in_colorado) { create(:tool, name: 'Hammer', address: 'Denver, CO', borrower_id: nil) }
    let!(:tool_in_california) { create(:tool, name: 'Screwdriver', address: '90210', borrower_id: nil) }
    let!(:tool_in_nm) { create(:tool, name: 'Drill Press', address: 'NM, 87501', borrower_id: nil) }

    it 'returns a list of tools by name and state' do
      result = Tool.search_by_name_and_state_or_zip('Hammer', 'Denver, CO')

      expect(result).to eq([tool_in_colorado])
      expect(result).to_not eq([tool_in_california])
      expect(result).to_not eq([tool_in_nm])
    end

    it 'returns a list of tools by name and zip' do
      result = Tool.search_by_name_and_state_or_zip('Screwdriver', '90210')

      expect(result).to eq([tool_in_california])
      expect(result).to_not eq([tool_in_colorado])
      expect(result).to_not eq([tool_in_nm])
    end

    it 'returns a list of tools by name, state, and zip' do
      result = Tool.search_by_name_and_state_or_zip('Drill Press', 'NM, 87501')

      expect(result).to eq([tool_in_nm])
      expect(result).to_not eq([tool_in_colorado])
      expect(result).to_not eq([tool_in_california])
    end

    it 'returns an error message if no tools are found' do
      result = Tool.search_by_name_and_state_or_zip('Jackhammer', '90210')

      expect(result).to be_empty
    end

    it 'returns all tools related to a user' do
      create_list(:tool, 5, user_id: 1, borrower_id: nil)
      create_list(:tool, 2, user_id: 2, borrower_id: 1)

      result = Tool.all_related_tools(1)
      results = Tool.all_related_tools(2)
      expect(result.count).to eq(7)
      expect(result).to_not eq(5)
      expect(result).to_not eq(2)
      expect(results.count).to eq(2)
    end
  end
end
