class Order < ApplicationRecord
	validates :address, :city, :state, :zipcode, presence: true
	validates :zipcode, zipcode: { country_code: :en }

	belongs_to :listing
	belongs_to :buyer, class_name: "User"
	belongs_to :seller, class_name: "User"
end
