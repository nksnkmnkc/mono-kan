class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null:false
      t.string :name, null:false
      t.text :memo, null:false
      t.date :start_time

      t.timestamps
    end
  end
end
