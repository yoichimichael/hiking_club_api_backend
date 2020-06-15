class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :member_id
      t.integer :hike_id

      t.timestamps
    end
  end
end