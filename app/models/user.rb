class User < ApplicationRecord

  # 이름에 대한 유효성 검사(최대 10글자, 첫 글자는 대문자로)
  validates :name, length: {maximum: 10}, presence: true
  def name=(s)
   write_attribute(:name, s.to_s.titleize)
 end

 # validation of age (should be only 20s)
 validates :age,
 numericality: { only_integer: true, greater_than: 19, less_than: 30}


 # validation of mail (format should be email)
 validates :mail,
 uniqueness: true,
 format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
 presence: true

  # realtion definition
  has_many :joins
  has_many :groups, through: :joins
end
