class Product < ActiveRecord::Base
	has_many :images, as: :entity
	accepts_nested_attributes_for :images
    validates :name, :presence => true
end
