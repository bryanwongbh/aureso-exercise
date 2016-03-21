ActiveAdmin.register Organization do

permit_params	:name, :public_name, :type, :pricing_policy

form do |f|
    f.inputs "Organization" do
      f.input   :name
    	f.input 	:public_name, label: "Public Display Name"
    	f.input 	:type, as: :select, collection: ["Show room", "Service", "Dealer"], label: "Type"
    	f.input 	:pricing_policy, as: :select, collection: ["Flexible", "Fixed", "Prestige"], label: "Pricing Policy"
  		end
  	f.actions
  end
end
