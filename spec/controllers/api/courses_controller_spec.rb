require 'rails_helper'

RSpec.describe Api::CoursesController do
    describe "GET #index" do
      before do
        get :index
      end
  
      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end
  
      it "JSON body response contains expected recipe attributes" do
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(["data", "message", "status"])
      end
    end
  end