class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.string :location
      t.date :date
      t.time :time
      t.float :distance
      t.float :duration
      t.text :description
      t.string :img_url
      t.integer :host_id

      t.timestamps
    end
  end
end
