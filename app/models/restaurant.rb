class Restaurant < ActiveRecord::Base
  belongs_to :user
  validates :name, :cuisine, :street, :city, :state, :zip, presence: true
end
