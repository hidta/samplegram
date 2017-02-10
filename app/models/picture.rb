class Picture < ActiveRecord::Base

  mount_uploader :photos_url, PhotosUploader

  belongs_to :user

end
