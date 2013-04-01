class RemoveColumnFromComments < ActiveRecord::Migration
  def up
  	remove_column :comments, :comment_by
  end

  def down
  	add_column :comments, :comment_by, :string
  end
end
