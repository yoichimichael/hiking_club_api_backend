class RenamePasswordInMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :members, :password, :password_digest
  end
end
