require 'rails_helper'

RSpec.describe "Api::V1::Admin::RankTiers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/rank_tiers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/admin/rank_tiers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/api/v1/admin/rank_tiers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/rank_tiers/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/rank_tiers/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
