class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :bulletin_board

  validates :comment, presence:true

end
