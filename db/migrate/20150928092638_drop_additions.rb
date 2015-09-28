class DropAdditions < ActiveRecord::Migration
  def change
    drop_table :additions
  end
end
