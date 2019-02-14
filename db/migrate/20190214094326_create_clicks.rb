class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.string :refer, :null => true
      t.integer :link_id

      t.timestamps
    end

    add_index :clicks, [:refer, :link_id]
    #add_foreign_key :clicks, :links, column: :link_id, primary_key: :id, on_delete: :cascade
  end
end
