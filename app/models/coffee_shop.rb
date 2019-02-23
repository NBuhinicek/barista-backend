class CoffeeShop < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  belongs_to :location
  has_many :coffee_tables, dependent: :destroy

  accepts_nested_attributes_for :location

  validates :name, presence: true
  validates :number_of_tables, presence: true,
                               numericality: { only_integer: true }

  validate :owner_must_have_store_owner_role

  scope :approved, -> { where(approved: true) }

  # TODO: will need better methods for validity
  def useable?
    Time.current < paid_till
  end

  private

  def create_tables
    CoffeeTablesGenerator.new(self).call
  end

  def owner_must_have_store_owner_role
    errors.add(:user, 'must be a store owner') unless user.role.store_owner?
  end
end
