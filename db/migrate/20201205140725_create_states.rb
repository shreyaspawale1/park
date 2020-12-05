class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name
      t.string :capital
      t.text :website

      t.timestamps
    end
  end
end
