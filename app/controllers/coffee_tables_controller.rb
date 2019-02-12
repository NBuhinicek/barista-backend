class CoffeeTablesController < ApplicationController
  def index
    @coffee_tables = CoffeeTable.all
  end

  def show
    @coffee_table = CoffeeTable.find(params[:id])
  end
end
