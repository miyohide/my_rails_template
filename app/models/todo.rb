# Todo モデルは、 やること（todo）の情報を保持するクラス
class Todo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 5000 }
end
