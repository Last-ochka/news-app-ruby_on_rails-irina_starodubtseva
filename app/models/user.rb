class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true

end
