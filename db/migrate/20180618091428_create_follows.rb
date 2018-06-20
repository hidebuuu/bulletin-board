class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :board_id
  end
end
