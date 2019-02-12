class CoffeeShopSerializer < BaseSerializer
  belongs_to :location

  attributes :name, :number_of_tables
end
