class Group < ApplicationRecord

  validates :name, length: {maximum: 20},uniqueness: true, presence: true

  # relation of group
  has_many :joins
  has_many :users, through: :joins
end
