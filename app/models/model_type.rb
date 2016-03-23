class ModelType < ActiveRecord::Base
  validates	:name, :model_type_slug, :model_type_code, :base_price, :model_id, presence: true

	belongs_to :model

	def total_price
	end
end
