require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  let(:user) { create(:user) }
  let(:access_life) { UserAuth.access_token_life }
  let(:refresh_life) { UserAuth.refresh_token_life }
  let(:access_token_key) { 'token' }
  let(:refresh_token_key) { 'refresh_token' }
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' } }
  let(:http_login_request) { post api_v1_sessions_path, headers: headers, params: params, xhr: true }

  describe "POST /create" do
    context "when email and password is valid" do
      let(:password) { 'password' }
      let(:params) { { email: user.email, password: password }.to_json }

      it "returns http success" do
        http_login_request

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)

        access_life_to_i = access_life.from_now.to_i
        refresh_life_to_i = refresh_life.from_now.to_i

        # jtiが保存されているかのチェック
        # refresh_jtiを格納するためのリロード
        user.reload
        expect(user.refresh_jti).not_to eq(nil)

        # レスポンスは正しいか
        expect(body['user']['id']).to eq(user.id)

        # レスポンスの有効期限は有効か
        # 誤差を許容
        expect(body['expires']).to be_within(2).of(access_life_to_i)

        # access_token
        access_token = User.decode_access_token(body[access_token_key])

        # ログインユーザーと一致するか
        expect(access_token.entity_for_user).to eq(user)

        # 有効期限はレスポンスと一致しているか
        token_exp = access_token.payload['exp']
        expect(body['expires']).to eq(token_exp)

        ## cookie
        cookie = request.cookie_jar.instance_variable_get(:@set_cookies)[refresh_token_key]

        # cookieの有効期限は有効か
        # 誤差を許容
        expect(cookie[:expires]).to be_within(2.seconds).of(Time.at(refresh_life_to_i, in: "+09:00"))

        # secureは一致しているか
        expect(cookie[:secure]).to eq(Rails.env.production?)

        # http_onlyはtrueか
        expect(cookie[:http_only]).to be(true)

        ## refresh_token
        token_from_cookies = cookies[refresh_token_key]
        refresh_token = User.decode_refresh_token(token_from_cookies)

        # ログイン本人と一致しているか
        expect(refresh_token.entity_for_user).to eq(user)

        # jtiは一致しているか
        expect(refresh_token.payload["jti"]).to eq(user.refresh_jti)

        # token有効期限とcookie有効期限は一致しているか
        expect(refresh_token.payload["exp"]).to eq(refresh_life_to_i)
      end
    end

    context "when email and password is invalid" do
      let(:another_password) { "another_password" }
      let(:params) { { email: user.email, password: another_password }.to_json }

      it 'returns errors in json format' do
        http_login_request

        expect(response).to have_http_status(:not_found)
      end
    end

    context "when not ajax" do
      let(:password) { 'password' }
      let(:params) { { email: user.email, password: password }.to_json }

      it "returns errors in json format" do
        post api_v1_sessions_path, headers: headers, params: params, xhr: false

        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "POST /refresh" do
    let(:http_refresh_request) { post refresh_api_v1_sessions_path, headers: headers, xhr: true }

    context "refresh is valid" do
      let(:password) { 'password' }
      let(:params) { { email: user.email, password: password }.to_json }

      it "returns http success" do
        # ログイン処理
        http_login_request

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)

        # ログイン後のトークンが正常に発行されているか
        user.reload
        old_access_token = body['token']
        expect(old_access_token).not_to eq(nil)
        expect(cookies['refresh_token']).not_to be_empty
        expect(user.refresh_jti).not_to eq(nil)

        # トークンリフレッシュ処理
        http_refresh_request
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)

        # リフレッシュ後のトークンが正常に発行されているか
        user.reload
        new_access_token = body['token']

        expect(new_access_token).not_to eq(nil)
        expect(cookies['refresh_token']).not_to be_empty
        expect(user.refresh_jti).not_to eq(nil)

        # トークンが新しく発行されているか
        expect(new_access_token).not_to eq(old_access_token)

        # userオブジェクトのリフレッシュトークンと最新のリフレッシュトークンは一致しているか
        payload = User.decode_refresh_token(cookies['refresh_token']).payload
        expect(payload['jti']).to eq user.refresh_jti
      end
    end

    context "refresh is invalid" do
      it "returns errors in json format" do
        # リフレッシュトークンがない場合、アクセスできないか
        http_refresh_request

        expect(response).to have_http_status(:unauthorized)

        # cookieは削除されているか
        expect(cookies['refresh_token']).to be_empty

        # 有効期限後にアクセスできるか
        travel_to (refresh_life.from_now) do
          http_refresh_request

          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    let(:password) { 'password' }
    let(:params) { { email: user.email, password: password }.to_json }
    let(:http_logout_request) { delete api_v1_sessions_path, headers: headers, xhr: true }

    context "logout is valid" do
      it "returns http success" do
        # ログイン処理
        http_login_request

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
        user.reload
        expect(user.refresh_jti).not_to eq(nil)
        expect(request.cookie_jar['refresh_token']).not_to be_empty

        # ログアウト処理
        http_logout_request

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
        expect(cookies['refresh_token']).to be_empty
        user.reload
        expect(user.refresh_jti).to eq(nil)
      end

      it "returns errors in json format" do
        # ログイン処理
        http_login_request

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
        expect(cookies['refresh_token']).not_to be_empty

        travel_to (refresh_life.from_now) do
          http_logout_request

          expect(response).to have_http_status(:unauthorized)
          expect(cookies['refresh_token']).to be_empty
        end
      end
    end
  end
end
