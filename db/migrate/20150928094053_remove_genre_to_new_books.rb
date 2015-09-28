class RemoveGenreToNewBooks < ActiveRecord::Migration
  def change
    remove_foreign_key :new_books, column: :genre_id
    remove_column :new_books, :genre_id
  end
end
