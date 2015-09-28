class DropAdditionsAndAdditionHistories < ActiveRecord::Migration
  def change
    drop_table :additions
    drop_table :addition_histories
  end
end
