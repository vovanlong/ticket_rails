class User < ApplicationRecord
  has_many :events
  validates_presence_of  :password_digest
  validates  :email , uniqueness: {message: "already subscribed"} 
  # validates  :name , uniqueness: true
  validates  :email, presence: {message: " Email Message required!"}
  validates  :name, presence: {message: " Name Message required!"} 
  has_secure_password

  enum admin: [:guest, :admin]
end
