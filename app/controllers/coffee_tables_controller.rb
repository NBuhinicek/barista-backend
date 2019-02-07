class CoffeeTablesController < ApplicationController
  def index
    @coffee_tables = CoffeeTable.all
  end

  def show
    @coffee_table = CoffeeTable.find(params[:id])
  end

  def qr_code
    @coffee_table = CoffeeTable.find_by(qr_code_hash: params[:hash])
    render 'coffee_tables/show'
  end
end
