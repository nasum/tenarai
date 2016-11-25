CarrierWave.configure do |config|
  case Rails.env
  when 'production'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region: ENV['AWS_REGION']
    }

    config.fog_directory = ENV['BUCKET_NAME']
    config.asset_host = "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['BUCKET_NAME']}"
  end
end
