module UserSessionize
  def sessionize_user
    session_user.present? || unauthorized
  end

  def delete_session
    cookies.delete(:refresh_token)
  end

  private

  def token_from_cookies
    # 一時的に出力
    p "リフレッシュトークン: #{cookies[:refresh_token]}"
    cookies[:refresh_token]
  end

  def find_user_from_refresh_token
    User.from_refresh_token(token_from_cookies)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError, JWT::EncodeError
    nil
  end

  def session_user
    @_session_user ||= find_user_from_refresh_token
  end

  def unauthorized
    delete_session
    head(:unauthorized)
  end
end
