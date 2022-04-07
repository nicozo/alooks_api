require 'rails_helper'

RSpec.describe "Api::V1::Admin::Platforms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/admin/platforms/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/api/v1/admin/platforms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/admin/platforms/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/api/v1/admin/platforms/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/admin/platforms/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/admin/platforms/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
