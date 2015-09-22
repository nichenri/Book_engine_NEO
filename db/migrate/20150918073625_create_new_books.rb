class CreateNewBooks < ActiveRecord::Migration
  def change
    create_table :new_books do |t|
      t.string :title
      t.string :author
      t.string :publisher

      t.timestamps null: false
    end
  end
end
