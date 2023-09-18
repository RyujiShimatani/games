class CreateCustomersGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :customers_genres, id: false do |t|
      t.belongs_to :customer
      t.belongs_to :genre
    end

    add_index :customers_genres, [:customer_id, :genre_id], unique: true
  end
end
