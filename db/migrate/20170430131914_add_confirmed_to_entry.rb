class AddConfirmedToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :confirmed, :string
  end
end
