class CreateRecruitmentTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_tags do |t|
      t.integer :recruitment_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
