class AddMoreToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :ppain, :integer
    add_column :entries, :pactivity, :integer
    add_column :entries, :pdoses, :integer
  end
end
