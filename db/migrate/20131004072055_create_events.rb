class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.belongs_to :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
