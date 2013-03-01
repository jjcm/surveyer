class RenameColumnsForLinking < ActiveRecord::Migration
  def up
    rename_column :answers, :quiz, :quiz_id
    rename_column :answers, :option, :option_id
    rename_column :answers, :user, :user_id
  end

  def down
  end
end
