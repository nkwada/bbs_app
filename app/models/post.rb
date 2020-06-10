class Post < ApplicationRecord
  belongs_to :topic

   validates :topic, presence: true
   validates :name, presence: true
   validates :body, presence: true, length: { in: 1..1000 }
end
