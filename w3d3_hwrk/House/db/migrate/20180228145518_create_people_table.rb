class CreatePeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :house, null: false
      t.integer :house_id, null: false
      
      t.timestamps
    end
  end
end
