class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :description, :rating, presence: true
end
