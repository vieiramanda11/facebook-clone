# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :content, presence: true, length: { minimum: 5 }
  default_scope -> { order(created_at: :desc) }
end
