class CreateUtilizations < ActiveRecord::Migration[6.1]
  def change
    create_table :utilizations do |t|

      t.timestamps
    end
  end
end
