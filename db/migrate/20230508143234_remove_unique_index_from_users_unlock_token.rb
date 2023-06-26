class RemoveUniqueIndexFromUsersUnlockToken < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :unlock_token
  end
end
