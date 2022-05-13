class User < ApplicationRecord
   has_many :gossips
   belongs_to :city
   has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
   has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
   has_many :comments
   has_many :likes, dependent: :destroy
   has_secure_password
   #validates :email, presence: true, uniqueness: true
   def self.get_user(id)
      return User.all[id.to_i - 1]
   end

   def remember(remember_token)
      remember_digest = BCrypt::Password.create(remember_token)
      self.update(remember_digest: remember_digest)
    end
end
