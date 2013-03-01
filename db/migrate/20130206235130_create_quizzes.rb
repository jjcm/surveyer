class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
