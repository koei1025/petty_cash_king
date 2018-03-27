class CreateLookupSorts < ActiveRecord::Migration[5.1]
  def change
    create_table :lookup_sorts do |t|
      t.string :sort
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
