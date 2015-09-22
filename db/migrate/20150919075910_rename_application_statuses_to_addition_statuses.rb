class RenameApplicationStatusesToAdditionStatuses < ActiveRecord::Migration
  def change
    rename_table :application_statuses, :addition_statuses
  end
end
