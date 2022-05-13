class City < ApplicationRecord
   has_many :users

   CITY = City.all
   
   def self.get_city(id)
      return City.all[id.to_i - 1]
   end
end
