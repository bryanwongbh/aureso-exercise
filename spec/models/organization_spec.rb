require 'rails_helper'

describe Organization do
	context "validations" do
		it { should validate_presence_of(:name)}
		it { should validate_presence_of(:public_name)}
		it { should validate_presence_of(:type)}
		it { should validate_presence_of(:pricing_policy)}
	end
	context "relationships" do
		it { should have_many(:models)}
	end
	context "multi-record input" do
		it { should accept_nested_attributes_for(:models)}
	end	
end
