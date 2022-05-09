class User < ApplicationRecord
   has_many :gossips
   belongs_to :city
   has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
   has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

   def self.get_user(id)
      return User.all[id.to_i - 1]
   end
end
