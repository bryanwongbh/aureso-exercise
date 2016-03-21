require 'rails_helper'

describe AdminUser do
	context "validations" do
		it { should validate_presence_of(:email)}
	end
end