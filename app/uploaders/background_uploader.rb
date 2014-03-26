# encoding: utf-8
class BackgroundUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
