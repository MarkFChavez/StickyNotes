class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :comment_by
      t.integer :note_id

      t.timestamps
    end
    add_index :comments, :note_id
  end
end
