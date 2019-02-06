require 'barby'
require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'

class QrCodeGenerator
  def initialize(digest)
    @digest = digest
  end

  def call
    qr_code = Barby::QrCode.new(@digest, level: :q, size: 6)
    base64 = Base64.encode64(qr_code.to_png(xdim: 6))
    "data:image/png;base64,#{base64}"
  end
end
