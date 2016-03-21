class Organization < ActiveRecord::Base
	validates	:name, :public_name, :type,	:pricing_policy,	presence: true

	self.inheritance_column = :nil
end
