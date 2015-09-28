class DropAdditionStatuses < ActiveRecord::Migration
  def change
    drop_table :addition_statuses
  end
end
