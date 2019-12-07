class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.integer :user_id
      t.integer :category
      t.string :title
      t.text :body
      t.datetime :event_date
      t.integer :area
      t.string :address
      t.integer :recruitments_number
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
