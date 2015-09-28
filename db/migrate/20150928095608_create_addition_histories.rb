class CreateAdditionHistories < ActiveRecord::Migration
  def change
    create_table :addition_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :new_book, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
