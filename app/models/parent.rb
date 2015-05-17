class Parent < ActiveRecord::Base
	belongs_to  :childern
	has_one :contact
end
