class ChangeColumnToReservation < ActiveRecord::Migration
  def change
    change_column :reservations, :reservation_status_id, :integer, null: false, default: 4
  end
end
