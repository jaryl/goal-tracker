class User < ApplicationRecord

  has_many :goals
  has_many :items, through: :goals

  validates :name, :email, :password, presence: true

end
