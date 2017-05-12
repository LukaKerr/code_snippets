class AddUserIdToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :user_id, :integer
    add_index :snippets, :user_id
  end
end
