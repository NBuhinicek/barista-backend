class ImageUploader < Shrine
  plugin :validation_helpers
  # plugin :remove_attachment

  Attacher.validate do
    validate_mime_type_inclusion %w[image/jpeg image/png image/tiff]
    validate_extension_inclusion %w[jpg jpeg png tiff tif]
  end
end
