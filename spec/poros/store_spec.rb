# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store do
  describe 'initialize' do
    it 'exists' do
      store_data = { formatted_address: '1040 15th St, Denver, CO 80202, United States', name: 'Ace Hardware' }
      store = Store.new(store_data)

      expect(store).to be_a Store
      expect(store.formatted_address).to eq('1040 15th St, Denver, CO 80202, United States')
      expect(store.name).to eq('Ace Hardware')
    end
  end
end
