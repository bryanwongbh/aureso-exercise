class SimpleModelTypeSerializer < ActiveModel::Serializer
  attributes :name, :base_price, :total_price
end
