require 'rails_helper'

RSpec.describe "Api::V1::Applies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/applies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/applies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/applies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
