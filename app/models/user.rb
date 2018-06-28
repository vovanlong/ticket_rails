class User < ApplicationRecord
  #has_many :events
  validates_presence_of :name , :email , :password_digest
  validates  :email , uniqueness: true
  has_secure_password

  enum admin: [:guest, :admin]
end
