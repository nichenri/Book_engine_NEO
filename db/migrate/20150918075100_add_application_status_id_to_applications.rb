class AddApplicationStatusIdToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :application_status, index: true, foreign_key: true, default: 1
  end
end
