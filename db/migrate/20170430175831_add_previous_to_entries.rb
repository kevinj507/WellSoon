class AddPreviousToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :panger, :float
    add_column :entries, :pdisgust, :float
    add_column :entries, :pfear, :float
    add_column :entries, :psadness, :float
    add_column :entries, :pjoy, :float
  end
end
