require 'rails_helper'

RSpec.describe Tool, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :status }
    it { should validate_presence_of :address }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :borrower_id }
  end
end
