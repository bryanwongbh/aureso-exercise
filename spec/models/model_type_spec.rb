require 'rails_helper'

describe ModelType do
	context "validations" do
		it { should validate_presence_of(:name)}
		it { should validate_presence_of(:model_type_slug)}
		it { should validate_presence_of(:model_type_code)}
		it { should validate_presence_of(:base_price)}
		it { should validate_presence_of(:model_id)}
	end
	context "relationships" do
		it { should belong_to(:model)}
	end
end
