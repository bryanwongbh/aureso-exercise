require 'rails_helper'

describe "Messages API" do
  
  describe "Organization API requests" do
    it "index should return a list of organizations" do
      # test for the 200 status-code
      get '/api/organizations'
      expect(response).to be_success
    end
  end
  
  describe "Model API requests" do
    it "index should return a list of models" do
      # test for the 200 status-code
      get '/api/models'
      expect(response).to be_success
    end
  end
end