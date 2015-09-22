class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :new_book, index: true, foreign_key: true
      t.string :application_status, index: true, foreign_key: true, default: 1 
      t.date :arrive_at

      t.timestamps null: false
    end
  end
end
