class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :value, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, uniqueness: { scope: :book_id }
end
