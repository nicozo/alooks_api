module UserAuth
  mattr_accessor :access_token_life
  self.access_token_life = 30.minute

  mattr_accessor :refresh_token_life
  self.refresh_token_life = 1.day

  mattr_accessor :token_secret_signature_key
  self.token_secret_signature_key = Rails.application.credentials.secret_key_base

  mattr_accessor :token_algorithm
  self.token_algorithm = 'HS256'

  mattr_accessor :user_claim
  self.user_claim = :sub
end
