require 'rails_helper'

RSpec.describe "Api::V1::Registers", type: :request do
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' } }
  let(:http_request) { post api_v1_registers_path, headers: headers, params: params, xhr: true }

  describe "POST /create" do
    context "when email and password is valid" do
      let(:valid_user_attributes) { attributes_for(:user) }
      let(:params) { { user: valid_user_attributes }.to_json }

      it "returns http success" do
        http_request

        expect(body['user']['name']).to eq(valid_user_attributes[:name])
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end

    context "when email and password is invalid" do
      let(:invalid_user_attributes) { attributes_for(:user, name: nil, email: nil, password: nil) }
      let(:params) { { user: invalid_user_attributes }.to_json }

      it "returns errors in json format" do
        http_request

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

end
