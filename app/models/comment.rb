class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :bulletin_board
end
