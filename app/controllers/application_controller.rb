class ApplicationController < ActionController::API
  include ActionController::Cookies
  include UserAuthenticate
  include TokenGenerate

  # CSRF対策
  before_action :xhr_in_request_header?
  before_action :authenticate_user

  private

  def xhr_in_request_header?
    # リクエストヘッダ内にX-Requested-With: 'XMLHttpRequest'の存在を判定
    return if request.xhr?

    # なければ403エラーを返す
    render status: :forbidden, json: { status: 403, error: "Forbidden" }
  end
end
