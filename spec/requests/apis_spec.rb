require 'rails_helper'

describe "API Messages" do
  
  organization = FactoryGirl.create(:organization)
  model = FactoryGirl.create(:model)
  modeltype = FactoryGirl.create(:model_type)
  
  describe "Organization API requests" do
    it "INDEX should return a list of organizations" do
      get "/api/organizations"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it "SHOW should return an organization" do
      get "/api/organizations/#{organization.id}"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  describe "Model API requests" do
    it "INDEX should return a list of models" do
      get "/api/models"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it "SHOW should return a model" do
      get "/api/models/#{model.id}"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  describe "ModelType API requests" do
    it "INDEX should return a list of modeltypes" do
      get "/api/model_types"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it "SHOW should return a modeltype" do
      get "/api/model_types/#{modeltype.id}"
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
end