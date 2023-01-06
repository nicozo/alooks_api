require 'rails_helper'

RSpec.describe "Api::V1::Admin::Players", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/players/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/players/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/players/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
