class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 10_000 }
end
