class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :target_type, index: true
      t.references :target, polymorphic: true, index: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
