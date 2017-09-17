class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  scope :valid, -> { where('expires_at IS null OR expires_at > ?', Time.now) }

  EXPIRES_IN = 30.days

  def self.generate(user)
    create(token: SecureRandom.hex(16), expires_at: Time.now + EXPIRES_IN, user: user)
  end
end
