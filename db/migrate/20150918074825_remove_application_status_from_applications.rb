class RemoveApplicationStatusFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :application_status, :string
  end
end
