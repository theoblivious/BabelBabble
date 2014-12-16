class SetDefaultTrueToGameMode < ActiveRecord::Migration
  def change
    change_column :chatrooms, :game_mode, :boolean, :default => false
  end
end
