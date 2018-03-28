class CreateJobDefines < ActiveRecord::Migration[5.1]
  def change
    create_table :job_defines do |t|
      t.string :worker_type
      t.string :job_class
      t.string :report_code
      t.string :name
      t.boolean :system_only
      t.boolean :mutual_exclusion

      t.timestamps
    end
  end
end
