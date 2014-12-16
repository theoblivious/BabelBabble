class RenameQuizidToQuestionidOnChatroomTable < ActiveRecord::Migration
  def change
    rename_column :chatrooms, :quiz_id, :question_id
  end
end
