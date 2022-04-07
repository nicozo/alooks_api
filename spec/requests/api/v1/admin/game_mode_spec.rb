require 'rails_helper'

RSpec.describe "Api::V1::Admin::GameModes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/game_mode/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/admin/game_mode/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/api/v1/admin/game_mode/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/game_mode/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/game_mode/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
