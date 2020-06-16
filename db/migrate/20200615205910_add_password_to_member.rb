class AddPasswordToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :password, :string
  end
end
