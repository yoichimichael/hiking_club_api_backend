class AddStartAtToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :start_at, :datetime
  end
end
