class Childern < ActiveRecord::Base
	has_one :parent
	has_one :contact, through: :parent
end
