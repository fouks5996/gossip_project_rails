class Gossip < ApplicationRecord
   validates :title, length: {minimum: 3, maximum:25}, presence: true
   validates :content, presence: true
   belongs_to :user
   has_many :joins
   has_many :comments
   has_many :tags, through: :joins

   def self.time_ago(x)
      ((Time.new - (x.created_at)).round(0))/60
   end
end
