class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  scope :valid, -> { where('expires_at IS null OR expires_at > ?', Time.now) }
end
