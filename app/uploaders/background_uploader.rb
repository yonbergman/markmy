# encoding: utf-8
class BackgroundUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
end
