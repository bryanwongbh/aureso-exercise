class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :public_name, :type, :pricing_policy
end
