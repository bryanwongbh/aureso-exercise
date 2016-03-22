ActiveAdmin.register Model do
permit_params	:name, :model_slug, :organization_id

form do |f|
    f.inputs "Organization" do
      f.input   :name
    	f.input 	:model_slug
    	f.input   :organization_id, as: :select, collection: Organization.all.map{|u| ["#{u.name}", u.id]}
  		end
  	f.actions
  end
end
