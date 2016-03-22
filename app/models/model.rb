class Model < ActiveRecord::Base
	validates	:name, :model_slug, :organization_id, presence: true

	belongs_to :organization
	has_many	:model_types
	
	accepts_nested_attributes_for	:model_types, allow_destroy: true 
end
