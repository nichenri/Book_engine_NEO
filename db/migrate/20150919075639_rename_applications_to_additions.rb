class RenameApplicationsToAdditions < ActiveRecord::Migration
  def change
    rename_table :applications, :additions
  end
end
