class RemoveEmailFromEntry < ActiveRecord::Migration[5.1]
  def change
    remove_column :entries, :email, :string
  end
end
