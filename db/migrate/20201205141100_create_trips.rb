class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :park_id
      t.date :departs_at

      t.timestamps
    end
  end
end
