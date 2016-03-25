module RequestSpecHelper
  include Warden::Test::Helpers

  # for use in request specs
  def sign_in
    @user ||= FactoryGirl.create :user
    login_as @user
  end
end