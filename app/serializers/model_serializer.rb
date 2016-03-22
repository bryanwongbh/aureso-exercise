class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_slug, :organization_id
end
