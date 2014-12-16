class ChangeChatroomToChatrooms < ActiveRecord::Migration
  def change
    rename_table :chatroom, :chatrooms
  end
end
