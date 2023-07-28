require 'rails_helper'

RSpec.describe "Store", type: :request do
  describe "Store search by location radius" do
    it "returns list of stores", :vcr do
      headers = { "CONTENT_TYPE" => "application/json" }
      get "/api/v1/stores/80202/25", headers: headers

      stores = JSON.parse(response.body, symbolize_names: true)

      expect(stores).to be_a Hash
      expect(stores).to have_key :results
      expect(stores[:results]).to be_an Array
    end
  end
end