class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, :cuisine, :street, :city, :state, :zip, presence: true
end
