class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :answer_id
      t.boolean :response
      t.integer :option_id

      t.timestamps
    end
  end
end
