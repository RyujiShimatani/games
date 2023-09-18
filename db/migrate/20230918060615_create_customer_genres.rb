class CreateCustomerGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_genres do |t|

      t.timestamps
    end
  end
end
