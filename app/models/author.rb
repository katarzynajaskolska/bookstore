class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true, length: { maximum: 150 }
  validates :last_name, presence: true, length: { maximum: 150 }
  validates :bio, presence: true, length: { maximum: 1000 }
  validates :birthday, presence: true
  validates :nationality, presence: true, length: { maximum: 150 }
end
