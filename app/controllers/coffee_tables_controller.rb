class CoffeeTablesController < ApplicationController
  def index
    @coffee_tables = CoffeeTable.all
  end
end
