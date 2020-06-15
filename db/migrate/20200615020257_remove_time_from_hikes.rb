class RemoveTimeFromHikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :hikes, :time, :time
  end
end
