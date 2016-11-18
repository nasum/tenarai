class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, uniqueness: true
  validates :email, uniqueness: true

  def to_param
    name
  end
end
