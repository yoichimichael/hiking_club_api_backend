class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :img_url

      t.timestamps
    end
  end
end
