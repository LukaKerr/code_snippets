class ChangeKarmaColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :karma, :rep
  end
end
