class Bot < ActiveRecord::Base

	self.abstract_class = true

	attr_accessible :name

	belongs_to :user

end