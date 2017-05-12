class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :css
      t.text :html
      t.text :javascript
      t.text :ruby
      t.text :python

      t.timestamps null: false
    end
  end
end
