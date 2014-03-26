CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['FOG_KEY'] || '',
    :aws_secret_access_key  => ENV['FOG_SECRET'] || '',
    # :region                 => 'eu-west-1'
  }
  config.fog_directory  = ENV['FOG_BUCKET'] || ''
  
end
