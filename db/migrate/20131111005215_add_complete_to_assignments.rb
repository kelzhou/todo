class AddCompleteToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :complete, :bool
  end
end
