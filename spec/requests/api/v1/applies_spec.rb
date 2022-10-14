require 'rails_helper'

RSpec.describe "Api::V1::Applies", type: :request do
  let!(:user) { create(:user) }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
  let!(:access_token) { user.encode_access_token.token }

  describe "GET /index" do
    let!(:room) { create(:room, user: user) }
    let(:apply_num) { 10 }
    let(:http_request) { get api_v1_applies_path, headers: headers, xhr: true }

    before do
      create_list(:apply, apply_num, room: room)
    end

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body.count).to eq(apply_num)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST /create" do
    let!(:another_user) { create(:user, :profile_completed_user) }
    let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
    let!(:access_token) { another_user.encode_access_token.token }

    context "with access_token" do
      let!(:room) { create(:room, user: user) }
      let(:request_message) { 'test message' }
      let(:apply_params) { { apply: { body: request_message, room_id: room.id } } }
      let(:http_request) { post api_v1_applies_path, headers: headers, params: apply_params.to_json, xhr: true }

      it "returns rooms in json format" do
        http_request

        expect(body['body']).to eq(apply_params[:apply][:body])
        expect(body['room_id']).to eq(apply_params[:apply][:room_id])
        expect(body['host_id']).to eq(room.user_id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PATCH /read" do
    let!(:apply) { create(:apply) }
    let(:http_request) { patch read_api_v1_apply_path(apply.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['is_read']).to eq(true)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
