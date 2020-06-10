class Topic < ApplicationRecord
  	has_many :posts, dependent: :destroy
  	has_many :topic_categories
  	has_many :categories, through: :topic_categories

  	belongs_to :user

  	accepts_nested_attributes_for :posts

	validates :title, presence: true, length: { in: 4..127 }
end
