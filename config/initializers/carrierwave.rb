# https://github.com/carrierwaveuploader/carrierwave/issues/1338
class CarrierWave::Uploader::Base
  def read
    # TODO: fix CarrierWave so the file doesn't return a temp file, the problem
    # is somewhere around
    # https://github.com/carrierwaveuploader/carrierwave/blob/master/lib/carrierwave/storage/fog.rb#L383
    #
    # We have to read from data_file.url because data_file.read is still bound
    # to a temp file in some cases, which has already been deleted, causing a
    # "closed stream" error. So, if the result of .read isn't a string, we try
    # to treat it like a url!
    content = file.read
    content = open(url).read unless content.is_a? String
    content
  end
end

CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
      provider: 'Google',
      google_storage_access_key_id: 'GOOGAMC2MYFWNWLZKGLXTMVA',
      google_storage_secret_access_key: 'tum3NazTGMJjAjuAV9q0zEEEaTi8ri6dBNisgdVz'
  }
  config.fog_directory = 'tezy'
end