require 'rails_helper'

describe ModelType do
	context "validations" do
		it { should validate_presence_of(:base_price)}
	end
	context "relationships" do
		it { should belong_to(:model)}
	end
end
