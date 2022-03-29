require 'jwt'

module UserAuth
  class RefreshToken
    include TokenCommons

    attr_reader :user_id, :payload, :token

    def initialize(user_id: nil, token: nil)
      if token.present?
        @token = token
        @payload = JWT.decode(@token, secret_key, true, verify_claims).first
        @user_id = get_user_id_from(@payload)
      else
        @user_id = user_id
        @payload = claims
        @token = JWT.encode(@payload, secret_key, algorithm, header_fields)
        remember_jti(user_id)
      end
    end

    private

    def refresh_token_life
      UserAuth.refresh_token_life
    end

    def refresh_token_expiration
      refresh_token_life.from_now.to_i
    end

    def jwt_id
      SecureRandom.uuid
    end

    def claims
      {
        user_claim => @user_id,
        jti: jwt_id,
        exp: token_expiration
      }
    end

    def payload_jti
      @payload[:jti]
    end

    def remember_jti(user_id)
      User.find(user_id).remember(payload_jti)
    end

    def verify_jti?(jti, payload)
      user_id = get_user_id_from(payload)
      decode_user = user_id
      decode_user.refresh_jti == jti
    rescue ActiveRecord::RecordNotFound
      false
    end

    def verify_claims
      {
        verify_expiration: true,
        verify_jti: proc { |jti, payload|
          verify_jti?(jti, payload)
        },
        algorithm: algorithm
      }
    end
  end
end

