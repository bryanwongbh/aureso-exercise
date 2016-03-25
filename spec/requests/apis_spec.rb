require 'rails_helper'

describe "API Messages" do
  before(:each) do
    @organization = FactoryGirl.create :organization
    @model = FactoryGirl.create :model
  end
  
  describe "GET Model API request" do
    it "does not return a model" do
      get "/api/models/#{@model.model_slug}/model_types"
      
      @model = response_body["model"]
      expect(response.status).to eq 401
    end
    it "returns a model" do
      sign_in
      get "/api/models/#{@model.model_slug}/model_types"
      
      @model = response_body["model"]
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  describe "GET ModelType API request" do
    it "returns a model_type" do
      @model_type = FactoryGirl.create :model_type
      get "/api/models/#{@model.model_slug}/model_types_price/#{@model_type.model_type_slug}"
      
      @model_type = response_body["model_type"]
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  describe "POST ModelType API request" do
    it "returns newly created ModelType" do
      model_type_params = { "model_type" => { "model_slug" => "toyota", "model_type_slug" => "toyota-avanza", "base_price" => 15000 }}.to_json
      request_headers = { "Accept" => "application/json", "Content-Type" => "application/json"}
      post "/api/models/#{@model.model_slug}/model_types_price", model_type_params, request_headers
      expect(ModelType.first.name).to eq "toyota-avanza"
    end
  end
  
  def response_body
    JSON.parse(response.body)
  end
end