class CreateBorrowings < ActiveRecord::Migration
  def change
    create_table :borrowings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.datetime :return_at

      t.timestamps null: false
    end
  end
end
