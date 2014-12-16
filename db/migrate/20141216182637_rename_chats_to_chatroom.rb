class RenameChatsToChatroom < ActiveRecord::Migration
  def change
    rename_table :chats, :chatroom
  end
end
