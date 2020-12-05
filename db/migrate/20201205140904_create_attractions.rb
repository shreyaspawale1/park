class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.integer :park_id
      t.integer :activity_id
      t.string :name

      t.timestamps
    end
  end
end
