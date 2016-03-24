require 'rails_helper'

describe "API Messages" do
  before(:each) do
    @model = FactoryGirl.create :model
    @model_type = FactoryGirl.create :model_type
  end
  
  describe "GET Model API request" do
    it "returns a model" do
      get "/api/models/#{@model.model_slug}/model_types"
      
      @model = response_body["model"]
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  describe "GET ModelType API request" do
    it "returns a model_type" do
      get "/api/models/#{@model.model_slug}/model_types_price/#{@model_type.model_type_slug}"
      
      @model_type = response_body["model_type"]
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  def response_body
    JSON.parse(response.body)
  end
end