class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.boolean :open_year_round
      t.string :website
      t.integer :state_id

      t.timestamps
    end
  end
end
