require 'rails_helper'

RSpec.describe ChatService, :vcr do
  describe 'instance methods' do
    it "#get_tools" do
      project = "deck"
      chat_service = ChatService.new.get_tools(project)

      expect(chat_service).to be_a String
    end
  end
end