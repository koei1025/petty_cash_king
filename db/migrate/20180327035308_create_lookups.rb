class CreateLookups < ActiveRecord::Migration[5.1]
  def change
    create_table :lookups do |t|
      t.integer :lookup_sort_id
      t.string :code
      t.string :name
      t.string :description
      t.string :tag
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end
end
