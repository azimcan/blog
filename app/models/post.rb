class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_rich_text :body

  enum status: %i[draft published archived trashed]

  validates :title,
            presence: true,
            length: { in: 4..36 }

  validates :body,
            presence: true,
            length: { in: 36..10_000 }

  validates :status,
            presence: true
end
