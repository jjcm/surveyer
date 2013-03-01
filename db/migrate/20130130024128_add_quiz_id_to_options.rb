class AddQuizIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :quiz_id, :integer
  end
end
