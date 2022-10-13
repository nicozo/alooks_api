require 'rails_helper'

RSpec.describe "Api::V1::Agreements", type: :request do
  let!(:current_user) { create(:user, :profile_completed_user) }
  let(:applicant) { create(:user) }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', Authorization: "Bearer #{access_token}" } }
  let!(:access_token) { current_user.encode_access_token.token }
  let!(:apply) { create(:apply, user: applicant) }

  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "GET /create" do
    let(:agreement_message) { 'test agreement' }
    let(:agreement_params) { { agreement: { body: agreement_message, applicant_id: applicant.id, room_id: apply.room_id }, application_id: apply.id } }
    let(:http_request) { post api_v1_agreements_path, headers: headers, params: agreement_params.to_json, xhr: true }

    context "with access_token" do
      it "returns rooms in json format" do
        http_request

        expect(body['body']).to eq(agreement_params[:agreement][:body])
        expect(body['room_id']).to eq(agreement_params[:agreement][:room_id])
        expect(body['user_id']).to eq(current_user.id)
        expect(body['applicant_id']).to eq(agreement_params[:agreement][:applicant_id])
        expect(Apply.all).not_to include(apply)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
