class RemoveGenreIdFromCustomers < ActiveRecord::Migration[6.1]
  def up
    remove_column :customers, :genre_id, :integer
  end

  def down
    add_column :customers, :genre_id, :integer
  end
end
