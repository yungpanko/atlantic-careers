class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.references :job, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
