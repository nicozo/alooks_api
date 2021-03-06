class User < ApplicationRecord
  include TokenGenerate
  authenticates_with_sorcery!
  
  has_many :rooms, dependent: :destroy
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true, length: { maximum: 30, allow_blank: true }
  validates :self_introduction, length: { maximum: 255 }
  
  enum sex: { male: 0, female: 1 }
  enum role: { general: 0, admin: 1 }

  def remember(jti)
    update!(refresh_jti: jti)
  end

  def forget
    update!(refresh_jti: nil)
  end

  def response_json(payload = {})
    as_json(only: [:id, :name]).merge(payload).deep_stringify_keys
  end
end
