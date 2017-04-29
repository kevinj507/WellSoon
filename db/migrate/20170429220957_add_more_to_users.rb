class AddMoreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :opdate, :datetime
    add_column :users, :comorbids, :string, array:true, default: []
  end
end
