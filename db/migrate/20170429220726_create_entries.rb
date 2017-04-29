class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.datetime :date
      t.integer :pain
      t.text :diary
      t.string :medtype
      t.integer :activity
      t.integer :doses

      t.timestamps
    end
  end
end
