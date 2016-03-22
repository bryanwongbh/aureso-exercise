require 'rails_helper'

describe Model do
	context "validations" do
		it { should validate_presence_of(:name)}
		it { should validate_presence_of(:model_slug)}
		it { should validate_presence_of(:organization_id)}
	end
	context "relationships" do
		it { should belong_to(:organization)}
	end
end
