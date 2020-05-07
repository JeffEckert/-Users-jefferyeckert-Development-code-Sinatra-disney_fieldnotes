class ChangeDefaultPhotoForAttractions < ActiveRecord::Migration
  def change
    change_column_default :attractions, :photo, 'https://thumbs.dreamstime.com/b/walt-disney-world-12175498.jpg'
  end
end
