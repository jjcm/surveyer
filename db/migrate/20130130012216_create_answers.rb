class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user
      t.integer :quiz
      t.integer :option

      t.timestamps
    end
  end
end
