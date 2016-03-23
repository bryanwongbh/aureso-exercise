class ChangeBasePriceColumnToIntegerFromDecimal < ActiveRecord::Migration
  def change
  	remove_column	:model_types,	:base_price
  	add_column		:model_types,	:base_price,	:integer
  end
end
