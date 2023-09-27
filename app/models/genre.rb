class Genre < ApplicationRecord
  has_and_belongs_to_many :customers

  validates :name, presence:true
end
