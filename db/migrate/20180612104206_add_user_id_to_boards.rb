class AddUserIdToBoards < ActiveRecord::Migration[5.0]
  def change
    add_index :boards, :user_id
  end
end
