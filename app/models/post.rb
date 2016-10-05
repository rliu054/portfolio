class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  default_scope -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy
end
