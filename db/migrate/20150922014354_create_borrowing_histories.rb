class CreateBorrowingHistories < ActiveRecord::Migration
  def change
    create_table :borrowing_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.datetime :borrowed_at

      t.timestamps null: false
    end
  end
end
