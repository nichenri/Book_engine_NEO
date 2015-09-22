class RenameTitleColumnToAdditions < ActiveRecord::Migration
  def change
    rename_column :additions, :application_status_id, :addition_status_id
  end
end
