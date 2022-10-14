require 'jwt'

module UserAuth
  class AccessToken
    include TokenCommons

    attr_reader :user_id, :payload, :token

    def initialize(user_id: nil, token: nil)
      if token.present?
        @token = token
        @payload = JWT.decode(@token.to_s, secret_key, true, verify_claims).first
        @user_id = get_user_id_from(@payload)
      else
        @user_id = encrypt_for(user_id)
        # @user_id = user_id
        @payload = claims
        @token = JWT.encode(@payload, secret_key, algorithm, header_fields)
      end
    end

    def entity_for_user
      User.find(decrypt_for(@user_id))
    end

    # def entity_for_user
    #   User.find(@user_id)
    # end

    private

    def verify_user_id?
      @user_id.present?
    end

    def token_life
      UserAuth.access_token_life
    end

    def token_expiration
      token_life.from_now.to_i
    end

    def claims
      {
        user_claim => @user_id,
        exp: token_expiration
      }
    end

    def verify_claims
      {
        verify_expiration: true,
        algorithm:
      }
    end
  end
end
