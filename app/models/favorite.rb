class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :bulletin_board
end
