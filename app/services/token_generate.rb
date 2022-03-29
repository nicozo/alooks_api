module TokenGenerate
  extend ActiveSupport::Concern

  class_methods do
    def decode_access_token(access_token)
      UserAuth::AccessToken.new(token: access_token)
    end

    def from_access_token(access_token)
      decode_access_token(access_token).entity_for_user
    end

    def decode_refresh_token(refresh_token)
      UserAuth::RefreshToken.new(token: refresh_token)
    end

    def from_refresh_token(refresh_token)
      decode_refresh_token(refresh_token).entity_for_user
    end
  end

  def encode_access_token
    UserAuth::AccessToken.new(user_id: id)
  end

  def get_access_token
    encode_access_token.token
  end

  def encode_refresh_token
    UserAuth::RefreshToken.new(user_id: id)
  end

  def get_refresh_token
    encode_refresh_token.token
  end
end
