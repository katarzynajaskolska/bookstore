class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_many :rates

  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :published_at, presence: true
end
