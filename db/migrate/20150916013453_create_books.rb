class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_at
      t.references :author, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
