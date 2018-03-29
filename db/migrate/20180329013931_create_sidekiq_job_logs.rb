class CreateSidekiqJobLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :sidekiq_job_logs do |t|
      t.string :jid
      t.string :category
      t.string :source
      t.text :message

      t.timestamps
    end
  end
end
