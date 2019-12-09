class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string, null: false, default: '', limit: 100
  	add_column :users, :self_introduction, :string, limit: 500
  	add_column :users, :deleted_at, :datetime
  	add_column :users, :role, :integer
  end
end
