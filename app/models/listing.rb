class Listing < ActiveRecord::Base

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }

	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "noImage.jpg"
	else
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "noImage.jpg",
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ":style/:id_:filename"
	end

	# Validate content type
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :image


	belongs_to :user
end
