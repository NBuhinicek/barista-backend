class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]

  # GET /coffee_shops
  # GET /coffee_shops.json
  def index
    @coffee_shops = CoffeeShop.all.approved
  end

  # GET /coffee_shops/1
  # GET /coffee_shops/1.json
  def show; end

  # GET /coffee_shops/new
  def new
    @coffee_shop = CoffeeShop.new
    @coffee_shop.build_location
  end

  # GET /coffee_shops/1/edit
  def edit; end

  # POST /coffee_shops
  # POST /coffee_shops.json
  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)
    @location = @coffee_shop.location

    if @coffee_shop.save
      create_tables
      set_coordinates
      redirect_to @coffee_shop, notice: 'Coffee shop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /coffee_shops/1
  # PATCH/PUT /coffee_shops/1.json
  def update
    if @coffee_shop.update(coffee_shop_params)
      update_tables
      set_coordinates
      redirect_to @coffee_shop, notice: 'Coffee shop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coffee_shops/1
  # DELETE /coffee_shops/1.json
  def destroy
    @coffee_shop.destroy
    @location.destroy

    redirect_to coffee_shops_url, notice: 'Coffee shop was destroyed.'
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
    @location = @coffee_shop.location
  end

  def coffee_shop_params
    params.require(:coffee_shop).permit(
      :name, :number_of_tables,
      location_attributes: [:id, :street, :zip_code, :county, :country]
    ).merge(user: current_user)
  end

  # TODO: moglo bi se tu bolje napravit da je update i generator jedan service
  def create_tables
    CoffeeTablesGenerator.new(@coffee_shop).call
  end

  def update_tables
    CoffeeTablesUpdater.new(@coffee_shop).call
  end

  def set_coordinates
    @location.update(coordinates: CoordinatesFinder.new(@location).call)
  end
end
