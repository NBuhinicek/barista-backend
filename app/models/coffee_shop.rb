class CoffeeShop < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :coffee_tables, dependent: :destroy

  validates :number_of_tables, presence: true,
                               numericality: { only_integer: true }

  validate :owner_must_have_store_owner_role

  # TODO: will need better methods for validity
  def useable?
    Time.current < paid_till
  end

  private

  def owner_must_have_store_owner_role
    errors.add(:user, 'must be a store owner') unless user.role.store_owner?
  end
end
