class ChangeLanguagesColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :languages, :language
  end
end
