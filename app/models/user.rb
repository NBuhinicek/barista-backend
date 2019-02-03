class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enumeration :role,
              foreign_key: :role,
              class_name: Role

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
