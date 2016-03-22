require 'rails_helper'

describe Model do
	context "validations" do
		it { should validate_presence_of(:name)}
		it { should validate_presence_of(:model_slug)}
		it { should validate_presence_of(:organization_id)}
	end
	context "relationships" do
		it { should belong_to(:organization)}
		it { have_many(:model_types)}
	end
	context "multi-record input" do
		it { should accept_nested_attributes_for(:model_types)}
	end	
end
