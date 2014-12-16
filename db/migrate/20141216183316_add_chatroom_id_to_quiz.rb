class AddChatroomIdToQuiz < ActiveRecord::Migration
  def change
add_column :quizzes, :chatroom_id, :integer
  end
end
