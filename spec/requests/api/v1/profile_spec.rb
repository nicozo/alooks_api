require 'rails_helper'

RSpec.describe "Api::V1::Profiles", type: :request do
  let!(:user) { create(:user) }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
  let!(:access_token) { user.encode_access_token.token }

  describe "PATCH /update" do
    let(:updated_name) { 'updated name' }
    let(:user_params) { { user: { name: updated_name } } }
    let(:http_request) { patch api_v1_profile_path(user.id), headers: headers, params: user_params.to_json, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['user']['name']).to eq(updated_name)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
