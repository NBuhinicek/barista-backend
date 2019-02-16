class User < ApplicationRecord
  has_secure_token

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enumeration :role,
              foreign_key: :role,
              class_name: UserRole

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
