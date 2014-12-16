class UndoRenameQuizId < ActiveRecord::Migration
  def change
    rename_column :chatrooms,:question_id , :quiz_id
  end
end
