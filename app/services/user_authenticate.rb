module UserAuthenticate
  def authenticate_user
    current_user.present? || unauthorized
  end

  private

  def token_from_request_headers
    request.headers["Authorization"]&.split&.last
  end

  def find_user_from_access_token
    User.from_access_token(token_from_request_headers)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError, JWT::EncodeError
    nil
  end

  def current_user
    @_current_user ||= find_user_from_access_token
  end

  def unauthorized
    cookies.delete(:refresh_token)
    head(:unauthorized)
  end
end
