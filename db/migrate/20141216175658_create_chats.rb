class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :quiz_id
      t.boolean :game_mode

      t.timestamps
    end
  end
end
