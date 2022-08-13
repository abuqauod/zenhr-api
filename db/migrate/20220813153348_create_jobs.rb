class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :desc
      t.integer :created_by
      t.date :expiry_date

      t.timestamps
    end
  end
end
