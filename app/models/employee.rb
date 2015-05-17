class Employee < ActiveRecord::Base
has_many :juniors, :class=> Employee, :foreign_key => "junior_id"
#has_many :juniors, :class=> self, :foreign_key => "junior_id"
end
