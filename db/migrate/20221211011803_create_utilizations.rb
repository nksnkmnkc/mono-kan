class CreateUtilizations < ActiveRecord::Migration[6.1]
  def change
    create_table :utilizations do |t|
      t.integer :teacher_id, null: false
      t.integer :item_id, null: false
      t.integer :usage_rule, null: false
      t.integer :item_count, null: false
      t.timestamps
    end
  end
end
