class Book < ActiveRecord::Base
	belongs_to :store
	has_one :subject
end
