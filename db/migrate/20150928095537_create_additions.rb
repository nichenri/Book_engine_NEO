class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :new_book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
