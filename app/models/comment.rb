class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comment, presence: true, length: { minimum: 5 }
  default_scope -> { order(created_at: :desc) }
end
