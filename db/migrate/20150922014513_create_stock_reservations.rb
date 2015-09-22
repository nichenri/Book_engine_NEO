class CreateStockReservations < ActiveRecord::Migration
  def change
    create_table :stock_reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.datetime :invalid_at

      t.timestamps null: false
    end
  end
end
