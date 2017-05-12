class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :about, :text
    add_column :users, :website, :string
    add_column :users, :github, :string
    add_column :users, :languages, :text
  end
end
