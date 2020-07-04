class User < ApplicationRecord
  validates :name, :age, :password, :email, presence: true
  validates :name, uniqueness: true, length: { minimum: 4 }
end
