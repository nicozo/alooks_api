require 'rails_helper'

RSpec.describe "Api::V1::Clans", type: :request do
  let!(:user) { create(:user) }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
  let!(:access_token) { user.encode_access_token.token }

  describe "GET /index" do
    let(:clan_num) { 10 }
    let(:http_request) { get api_v1_clans_path, headers: headers, xhr: true }

    before do
      create_list(:clan, clan_num)
    end

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body.count).to eq(clan_num)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end

  end

  describe "GET /show" do
    let(:clan) { create(:clan, user: user) }
    let(:http_request) { get api_v1_clan_path(clan.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['id']).to eq(clan.id)
        expect(body['name']).to eq(clan.name)
        expect(body['concept']).to eq(clan.concept)
        expect(body['joining_process']).to eq(clan.joining_process)
        expect(body['prohibited_matters']).to eq(clan.prohibited_matters)
        expect(body['information']['enrollment']).to eq(clan.enrollment)
        expect(body['information']['activity_time']).to eq(clan.activity_time)
        expect(body['information']['enrollment_age']).to eq(clan.enrollment_age)
        expect(body['information']['snipe']).to eq(clan.snipe)
        expect(body['information']['contact_means']).to eq(clan.contact_means)
        expect(body['requirements']['platform']).to eq(clan.platform)
        expect(body['requirements']['age']).to eq(clan.age)
        expect(body['requirements']['required_login']).to eq(clan.required_login)
        expect(body['requirements']['required_ranked']).to eq(clan.required_ranked)
        expect(body['requirements']['required_vc']).to eq(clan.required_vc)
        expect(body['requirements']['personality']).to eq(clan.personality)
        expect(body['user_id']).to eq(user.id)
        expect(body['host']['id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST /create" do
    let(:clan_params) { attributes_for(:clan, user: user) }
    let(:http_request) { post api_v1_clans_path, headers: headers, params: clan_params.to_json, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['name']).to eq(clan_params[:name])
        expect(body['concept']).to eq(clan_params[:concept])
        expect(body['joining_process']).to eq(clan_params[:joining_process])
        expect(body['prohibited_matters']).to eq(clan_params[:prohibited_matters])
        expect(body['enrollment']).to eq(clan_params[:enrollment])
        expect(body['activity_time']).to eq(clan_params[:activity_time])
        expect(body['enrollment_age']).to eq(clan_params[:enrollment_age])
        expect(body['snipe']).to eq(clan_params[:snipe])
        expect(body['contact_means']).to eq(clan_params[:contact_means])
        expect(body['platform']).to eq(clan_params[:platform])
        expect(body['age']).to eq(clan_params[:age])
        expect(body['required_login']).to eq(clan_params[:required_login])
        expect(body['required_ranked']).to eq(clan_params[:required_ranked])
        expect(body['required_vc']).to eq(clan_params[:required_vc])
        expect(body['personality']).to eq(clan_params[:personality])
        expect(body['user_id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /edit" do
    let(:clan) { create(:clan, user: user) }
    let(:http_request) { get edit_api_v1_clan_path(clan.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['id']).to eq(clan.id)
        expect(body['name']).to eq(clan.name)
        expect(body['concept']).to eq(clan.concept)
        expect(body['joining_process']).to eq(clan.joining_process)
        expect(body['prohibited_matters']).to eq(clan.prohibited_matters)
        expect(body['enrollment']).to eq(clan.enrollment)
        expect(body['activity_time']).to eq(clan.activity_time)
        expect(body['enrollment_age']).to eq(clan.enrollment_age)
        expect(body['snipe']).to eq(clan.snipe)
        expect(body['contact_means']).to eq(clan.contact_means)
        expect(body['platform']).to eq(clan.platform)
        expect(body['age']).to eq(clan.age)
        expect(body['required_login']).to eq(clan.required_login)
        expect(body['required_ranked']).to eq(clan.required_ranked)
        expect(body['required_vc']).to eq(clan.required_vc)
        expect(body['personality']).to eq(clan.personality)
        expect(body['user_id']).to eq(user.id)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PATCH /update" do
    let(:clan) { create(:clan, user: user) }
    let(:http_request) { patch api_v1_clan_path(clan.id), headers: headers, params: clan_params, xhr: true }
    let(:updated_name) { 'updated name' }
    let(:clan_params) { attributes_for(:clan, name: updated_name).to_json }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['name']).to eq(updated_name)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:clan) { create(:clan, user: user) }
    let(:http_request) { delete api_v1_clan_path(clan.id), headers: headers, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        user.reload
        expect(user.clan).to eq(nil)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
