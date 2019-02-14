class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :name
      t.text :description, :null => true
      t.string :original, :null => false
      t.string :short, :null => false
      t.boolean :active, :default => true

      t.timestamps
    end

    add_index :links, [:active]
    add_index :links, [:short], unique: true
    add_index :links, [:short, :active]
    add_index :links, [:original]
    add_index :links, [:short, :active, :original]
  end
end
