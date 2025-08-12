class ChangeRoleToIntegerInUsers < ActiveRecord::Migration[8.0]
  def up
    change_column :users, :role, 'integer USING role::integer'
  end

  def down
    change_column :users, :role, :string
  end
end
