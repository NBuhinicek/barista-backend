class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
