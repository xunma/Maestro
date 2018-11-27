class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :navbar_image do
    cloudinary_transformation width: 35, height: 35, gravity: 'face', radius: 'max', crop: :thumb
  end

  version :profile_image do
    cloudinary_transformation width: 100, height: 100, gravity: 'face', radius: 'max', crop: :thumb
  end
end
