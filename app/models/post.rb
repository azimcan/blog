class Post < ApplicationRecord
	has_many :comments

	has_rich_text :body

	enum status: [ :draft, :published, :archived, :trashed ]

	validates :title,
						presence: true,
						length: { in: 4..36 }

	validates :body,
						presence: true,
						length: { in: 36..10000}

	validates :status,
						presence: true

end
