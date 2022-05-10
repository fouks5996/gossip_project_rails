class Gossip < ApplicationRecord
   validates :title, length: {minimum: 3, maximum:25}, presence: true
   validates :content, presence: true
   belongs_to :user
   has_many :joins
   has_many :tags, through: :joins
end
