class Gossip < ApplicationRecord
   belongs_to :user
   has_many :joins
   has_many :tags, through: :joins

   def self.get_gossip(id)
      return Gossip.all[id.to_i-1]
   end

end
