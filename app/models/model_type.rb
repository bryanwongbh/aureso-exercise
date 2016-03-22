class ModelType < ActiveRecord::Base
  validates	:name, :model_type_slug, :model_type_code, :base_price, presence: true

	belongs_to :model
end
