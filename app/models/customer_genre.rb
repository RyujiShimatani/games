class CustomerGenre < ApplicationRecord
  def change
    create_table :customers_genres, id: false do |t|
      t.belongs_to :customer
      t.belongs_to :genre
    end
  end
end
