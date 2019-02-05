class ItemType < Enumerations::Base
  # TODO: basic categories stalk coffee shop to find menu
  value :coffee,
        name: 'Coffee'
  value :alcoholic,
        name: 'Alcoholic beverage'
  value :nonalcoholic,
        name: 'Non alcoholic beverage'
  value :soda,
        name: 'Soda'
end
