class User < ApplicationRecord
  include TokenGenerate
  include Rails.application.routes.url_helpers

  authenticates_with_sorcery!

  after_initialize :set_default_value, if: :new_record?

  has_many :rooms, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :agreements, dependent: :destroy
  has_one :clan ,dependent: :destroy
  # has_many :clans ,dependent: :destroy
  has_one_attached :avatar

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true, length: { maximum: 30, allow_blank: true }
  validates :self_introduction, length: { maximum: 255 }
  validates :kd, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
  validates :highest_damage, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 0 }

  enum sex: { male: 0, female: 1 }
  enum role: { general: 0, admin: 1 }
  enum platform: { PS4: 0, PC: 1, X1: 3 }
  # Todo enumでは複数選択不可の為一旦コメントアウト
  # enum favorite_weapon: %w[
  #   havoc
  #   flatline
  #   hemlok
  #   r_301
  #   alternator
  #   prowler
  #   r_99
  #   volt
  #   car
  #   devotion
  #   l_star
  #   spitfire
  #   rampage
  #   g7
  #   triple_take
  #   repeater
  #   bocek
  #   charge_rifle
  #   long_bow
  #   kraber
  #   sentinel
  #   eva
  #   mastiff
  #   mozambique
  #   peace_keeper
  #   re45
  #   p2020
  #   wingman
  # ]
  

  def remember(jti)
    update!(refresh_jti: jti)
  end

  def forget
    update!(refresh_jti: nil)
  end

  def response_json(payload = {})
    as_json(
      only: %i[
        id
        name
        self_introduction
        date_of_birth
        sex
        game_id
        platform
        kd
        highest_damage
        favorite_weapons
      ],
      methods: %i[avatar_url]
    ).merge(payload).deep_stringify_keys
  end

  def avatar_url
    avatar.attached? ? url_for(avatar) : nil
  end

  def profile_completed
    game_id.present?
  end

  private

  def set_default_value
    self.self_introduction ||= 'よろしくお願いします！'
  end
end
