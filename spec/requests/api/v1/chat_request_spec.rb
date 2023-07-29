# spec/requests/api/v1/chat_service_spec.rb
require 'rails_helper'

RSpec.describe "ChatService API", type: :request do
  describe "GET /api/v1/chat_request" do
    it "returns a list of tools for a project" do

      project = "a deck"

      stub_request(:post, "https://api.openai.com/v1/completions").
        with(
          body: {
            model: "text-davinci-003",
            prompt: "What tools do I need to build #{project}?",
            max_tokens: 200,
            temperature: 0.5
          }.to_json,
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}"
          }
        ).
        to_return(
          status: 200,
          body: {
            choices: [{ text: "Tool 1, Tool 2, Tool 3" }]
          }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )

      get "/api/v1/chat_request", params: { project: project }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body, symbolize_names: true)).to eq({ tools: "Tool 1, Tool 2, Tool 3" })
    end
  end
end
