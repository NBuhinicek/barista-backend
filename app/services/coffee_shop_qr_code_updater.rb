class CoffeeShopQrCodeUpdater
  def initialize(coffee_shop)
    @coffee_shop = coffee_shop
  end

  def call
    update_qr_codes
  end

  private

  def update_qr_codes
    coffee_tables.each do |table|
      @table_number = table.table_number
      table.update(
        qr_code: QrCodeGenerator.new(qr_code_digest).call,
        qr_code_hash: qr_code_digest
      )
    end
  end

  def coffee_tables
    @coffee_tables ||= @coffee_shop.coffee_tables
  end

  def qr_code_digest
    Digest::SHA256.hexdigest(digest_string)
  end

  def digest_string
    "#{@coffee_shop.name}#{@table_number}#{@coffee_shop.id}#{Time.zone.today}"
  end
end
