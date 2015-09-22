class AddGenreToNewBooks < ActiveRecord::Migration
  def change
    add_reference :new_books, :genre, index: true, foreign_key: true
  end
end
