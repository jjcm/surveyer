class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :answer
      t.string :question
      t.string :inference
      t.integer :option_id

      t.timestamps
    end
  end
end
