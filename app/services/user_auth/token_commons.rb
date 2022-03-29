module UserAuth
  module TokenCommons
    def secret_key
      UserAuth.token_secret_signature_key
    end

    def algorithm
      UserAuth.token_algorithm
    end

    def get_user_id_from(payload)
      payload[user_claim]
    end

    def header_fields
      {
        typ: "JWT",
        alg: algorithm
      }
    end
  end
end

