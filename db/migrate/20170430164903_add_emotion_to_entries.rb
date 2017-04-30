class AddEmotionToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :anger, :float
    add_column :entries, :disgust, :float
    add_column :entries, :fear, :float
    add_column :entries, :joy, :float
    add_column :entries, :sadness, :float
  end
end
