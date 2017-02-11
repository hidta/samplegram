class Picture < ActiveRecord::Base

  validates :title, :comment, :photos_url, presence: true

  mount_uploader :photos_url, PhotosUploader

  belongs_to :user

end
