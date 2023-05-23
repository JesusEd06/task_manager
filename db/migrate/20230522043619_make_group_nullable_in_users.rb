class MakeGroupNullableInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :group_id, :integer, null: true
  end
end
