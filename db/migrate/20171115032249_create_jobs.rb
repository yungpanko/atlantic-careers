class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :link
      t.date :deadline
      t.string :location
      t.integer :creator_id, foreign_key: true, on_delete: :cascade
      t.references :company, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
