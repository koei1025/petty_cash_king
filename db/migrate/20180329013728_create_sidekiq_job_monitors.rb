class CreateSidekiqJobMonitors < ActiveRecord::Migration[5.1]
  def change
    create_table :sidekiq_job_monitors do |t|
      t.integer :job_define_id
      t.string :jid
      t.string :job_args
      t.integer :user_id
      t.datetime :expected_at
      t.datetime :executing_at
      t.datetime :complete_at
      t.string :status
      t.string :cron

      t.timestamps
    end
  end
end
