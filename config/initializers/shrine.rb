require 'shrine/storage/s3'

s3_options = {
  bucket:            Rails.application.credentials[:aws][:bucket],
  access_key_id:     Rails.application.credentials[:aws][:access_key_id],
  secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
  region:            Rails.application.credentials[:aws][:region]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
  store: Shrine::Storage::S3.new(**s3_options)
}

Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :activerecord
