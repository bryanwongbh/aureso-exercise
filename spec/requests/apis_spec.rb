require 'rails_helper'

describe "API Messages" do
  before(:each) do
    @model = FactoryGirl.create :model
  end
  
  describe "GET Model API request" do
    it "returns a model" do
      get api_model_path(@model)
      
      @model = response_body["model"]
      expect(response).to be_success
      expect(response.status).to eq 200
    end
  end
  
  def response_body
    JSON.parse(response.body)
  end
end