class AddDefaultPhotoToAttractions < ActiveRecord::Migration
  def change
    change_column_default :attractions, :photo, 'https://static3.srcdn.com/wordpress/wp-content/uploads/2020/03/disney-parks-featured.jpg?q=50&fit=crop&w=960&h=500'
  end
end
