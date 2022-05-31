class User < ApplicationRecord
  include TokenGenerate
  authenticates_with_sorcery!

  after_initialize :set_default_value, if: :new_record?
  
  has_many :rooms, dependent: :destroy
  has_one_attached :avatar
  
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
    as_json(only: [:id, :name, :self_introduction, :date_of_birth, :sex]).merge(payload).deep_stringify_keys
  end

  def avatar_url
    avatar.attached? ? Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true) : nil
  end

  private

  def set_default_value
    self.self_introduction ||= 'よろしくお願いします！'
  end
end
