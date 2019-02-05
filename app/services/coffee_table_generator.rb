class CoffeeTableGenerator
  def initialize(coffee_shop)
    @coffee_shop = coffee_shop
  end

  def call
    create_tables
  end

  private

  def create_tables
    1.upto(@coffee_shop.number_of_tables) do |i|
      @table_number = i
      CoffeeTable.create(
        coffee_shop: @coffee_shop,
        table_number: @table_number,
        qr_code: QrCodeGenerator.new(qr_code_digest).call,
        qr_code_hash: qr_code_digest
      )
    end
  end

  def qr_code_digest
    Digest::MD5.hexdigest(digest_string)
  end

  def digest_string
    "#{@coffee_shop.name}#{@table_number}#{@coffee_shop.id}"
  end
end
