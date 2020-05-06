class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :park
      t.text   :notes
      t.string :photo
      t.integer :user_id
    end

  end
end
