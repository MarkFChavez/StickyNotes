class AddVersionToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :lock_version, :integer, default: 0
  end
end
