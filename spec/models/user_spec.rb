require 'rails_helper'

describe User do
	let(:user) { FactoryGirl.create(:user) }
	subject { user }

	it { should be_valid }
	it { should respond_to(:email)}
	it { should respond_to(:password)}
	it { should respond_to(:authentication_token)}
end
