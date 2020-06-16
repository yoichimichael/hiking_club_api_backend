class RemovePasswordFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :password, :string
  end
end
