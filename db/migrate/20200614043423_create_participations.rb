class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.integer :member_id
      t.integer :hike_id

      t.timestamps
    end
  end
end
