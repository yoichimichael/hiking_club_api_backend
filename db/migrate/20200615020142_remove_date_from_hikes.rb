class RemoveDateFromHikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :hikes, :date, :date
  end
end
