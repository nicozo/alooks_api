require 'rails_helper'

RSpec.describe "Api::V1::Registers", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/registers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
