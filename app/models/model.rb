class Model < ActiveRecord::Base
	validates	:name, :organization_id, presence: true

	belongs_to :organization
	has_many	:model_types
	
	accepts_nested_attributes_for	:model_types, allow_destroy: true 

	extend FriendlyId
	friendly_id :name, use: :slugged, slug_column: :model_slug

	def should_generate_new_friendly_id?
  	new_record? || self.model_slug.blank?
	end
end
