class AddTitleToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :title, :string
  end
end
