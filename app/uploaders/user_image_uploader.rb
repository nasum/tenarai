# encoding: utf-8

class UserImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  case Rails.env
  when 'production'
    storage :fog
  when 'development'
    storage :file
  when 'test'
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [200, 200]

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "something.jpg" if original_filename
  end

end
