class Topic < ApplicationRecord
  	has_many :posts, dependent: :destroy
  	has_many :topic_categories
  	has_many :categories, through: :topic_categories

	validates :title, presence: true, length: { in: 4..127 }
  	validates :name, presence: true, length: { in: 1..30 }
end
