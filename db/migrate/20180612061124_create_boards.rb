class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
