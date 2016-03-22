class Organization < ActiveRecord::Base
	validates	:name, :public_name, :type,	:pricing_policy,	presence: true

	self.inheritance_column = :nil

	has_many	:models

	accepts_nested_attributes_for	:models, allow_destroy: true 
end
