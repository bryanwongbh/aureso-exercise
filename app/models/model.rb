class Model < ActiveRecord::Base
	validates	:name, :model_slug, :organization_id, presence: true

	belongs_to :organization
end
