class Signin
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :email, :password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true
end
