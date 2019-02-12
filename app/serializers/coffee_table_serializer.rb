class CoffeeTableSerializer < BaseSerializer
  belongs_to :coffee_shop

  attributes :table_number
end
