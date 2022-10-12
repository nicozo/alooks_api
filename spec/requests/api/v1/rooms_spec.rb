require 'rails_helper'

RSpec.describe "Api::V1::Rooms", type: :request do
  let!(:user) { create(:user, :profile_completed_user) }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
  let!(:access_token) { user.encode_access_token.token }


  describe "GET /index" do
    let(:room_num) { 10 }
    let(:http_request) { get api_v1_rooms_path, headers: headers, xhr: true }

    before do
      create_list(:room, room_num, user: user)
    end

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body.count).to eq(room_num)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /show" do
    let(:room) { create(:room, user: user) }
    let(:http_request) { get api_v1_room_path(room.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['id']).to eq(room.id)
        expect(body['title']).to eq(room.title)
        expect(body['platform']).to eq(room.platform)
        expect(body['game_mode']).to eq(room.game_mode)
        expect(body['rank_tier']).to eq(room.rank_tier)
        expect(body['recruitment_number']).to eq(room.recruitment_number)
        expect(body['user_id']).to eq(user.id)
        expect(body['host']['id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /create" do
    let(:room_params) { attributes_for(:room, application_deadline: 60, user: user) }
    let(:http_request) { post api_v1_rooms_path, headers: headers, params: room_params.to_json, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['title']).to eq(room_params[:title])
        expect(body['platform']).to eq(room_params[:platform])
        expect(body['game_mode']).to eq(room_params[:game_mode])
        expect(body['rank_tier']).to eq(room_params[:rank_tier])
        expect(body['recruitment_number']).to eq(room_params[:recruitment_number])
        expect(body['user_id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /edit" do
    let(:room) { create(:room, user: user) }
    let(:http_request) { get edit_api_v1_room_path(room.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['id']).to eq(room.id)
        expect(body['title']).to eq(room.title)
        expect(body['platform']).to eq(room.platform)
        expect(body['game_mode']).to eq(room.game_mode)
        expect(body['rank_tier']).to eq(room.rank_tier)
        expect(body['recruitment_number']).to eq(room.recruitment_number)
        expect(body['user_id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /update" do
    let(:room) { create(:room, user: user) }

    context "with access_token" do
      let(:http_request) { patch api_v1_room_path(room.id), headers: headers, params: room_params, xhr: true }
      let(:updated_title) { 'updated title' }
      let(:room_params) { attributes_for(:room, title: updated_title, application_deadline: 60).to_json }

      it "returns rooms in json format" do
        http_request

        expect(body['title']).to eq(updated_title)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /destroy" do
    let!(:room) { create(:room, user: user) }

    context "with access_token" do
      let(:http_request) { delete api_v1_room_path(room.id), headers: headers, xhr: true }

      it "returns rooms in json format" do
        http_request

        expect(user.rooms).not_to include(room)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
