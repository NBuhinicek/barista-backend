class CoffeeTablesUpdater
  def initialize(coffee_shop)
    @coffee_shop = coffee_shop
  end

  def call
    return unless number_changed?

    update_tables
  end

  private

  def update_tables
    CoffeeShop.first.coffee_tables.each(&:delete)
    CoffeeTablesGenerator.new(@coffee_shop).call
  end

  def coffee_tables
    @coffee_tables ||= @coffee_shop.coffee_tables
  end

  def number_changed?
    coffee_tables.count != @coffee_shop.number_of_tables
  end
end
