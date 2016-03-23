ActiveAdmin.register ModelType do

permit_params	:name, :model_type_slug, :model_type_code, :base_price, :model_id

form do |f|
    f.inputs "Organization" do
      f.input   :name
    	f.input 	:model_type_slug
    	f.input 	:model_type_code
    	f.input 	:base_price
    	f.input   :model_id, as: :select, collection: Model.all.map{|u| ["#{u.name}", u.id]}
  		end
  	f.actions
  end
end

