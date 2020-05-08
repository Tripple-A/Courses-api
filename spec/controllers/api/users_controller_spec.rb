require 'rails_helper'

RSpec.describe Api::UsersController do
  describe "GET #index" do
    before {get :index}

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["data", "message", "status"])
    end
  end

  describe "GET #show" do
  
  context 'validation test' do
  before {get :show, :params => {"id" => 1}}

    it "returns http failure when a user does not exist" do
      expect(response).to have_http_status(:not_found)
    end

    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array([ "message", "status"])
    end
  end
end

  describe "GET #create" do
  
  before {post :create, :params => {"username" => "edem", "password" => "password"}}

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["data", "message", "status"])
    end
  end
end
