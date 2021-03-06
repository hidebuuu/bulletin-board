class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :board_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end

    add_index :comments, :board_id
    add_index :comments, :user_id
  end
end
