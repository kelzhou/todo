class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :class_name
      t.string :homework
      t.string :due_date
      
      t.timestamps
    end
  end
end
