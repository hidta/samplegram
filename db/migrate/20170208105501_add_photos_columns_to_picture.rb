class AddPhotosColumnsToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :photos_url, :string
  end
end
