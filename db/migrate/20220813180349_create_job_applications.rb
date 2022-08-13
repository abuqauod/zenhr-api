class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.string :title
      t.integer :user_id
      t.integer :job_id
      t.boolean :status
      t.date :expiry_date

      t.timestamps
    end
  end
end
