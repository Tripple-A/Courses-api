require 'rails_helper'

RSpec.describe Api::UsersController, :type => :controller do
  describe 'GET #index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'JSON body response contains expected attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[data message status])
    end
  end

  describe 'GET #show' do
  let!(:users) { create_list(:user, 1) }
  let(:user_username) { users.first.username }

    context 'does not get a non existent user' do
      
      before { get :show, params: { 'id' => user_username } }

      it 'returns http success when a user exists' do

        expect(response).to have_http_status(:ok)
      end

      it 'JSON body response contains expected attributes' do
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(%w[message status data])
      end
    end

    context 'does not get a non existent user' do
      
      before { get :show, params: { 'id' => 5 } }

      it 'returns http failure when a user does not exists' do

        expect(response).to have_http_status(:not_found)
      end

      it 'JSON body response contains expected attributes' do
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(%w[message status])
      end
    end
  end

  describe 'POST #create' do
    before { post :create, params: {
       'username' => 'edem', 'password' => 'password', 'password_confirmation' => 'password' 
       } }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'JSON body response contains expected attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[data status])
    end
  end

  describe 'GET #fav' do
  let!(:users) { create_list(:user, 1) }
  let(:user_username) { users.first.username }

  before { get :fav, params: { 'id' => user_username }}

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[data status])
    end
  end
  
end

