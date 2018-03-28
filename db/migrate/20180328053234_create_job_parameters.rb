class CreateJobParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :job_parameters do |t|
      t.integer :job_define_id
      t.integer :seq
      t.string :code
      t.string :name
      t.string :parameter_type
      t.string :default_value
      t.integer :lookup_sort_id
      t.string :hardcode
      t.boolean :show_flag
      t.string :lookup_relation
      t.string :lookup_model
      t.string :lookup_model_key
      t.string :lookup_model_value
      t.string :relation_filter
      t.boolean :required
      t.boolean :allow_all

      t.timestamps
    end
  end
end
