require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /v1/sessions' do
    before(:each) do
      @user = FactoryGirl.create :user
    end
    it 'I should be able to create a session with email and password' do
      credentials = { email: @user.email, password: 'changeme' }
      post '/v1/sessions', session: credentials
      assert_response :success
      @user.reload
      expect(json_response[:auth_token]).to eq @user.auth_token
    end
    it 'I should be fail to create a session with invalid password' do
      credentials = { email: @user.email, password: 'wrong_password' }
      post '/v1/sessions', session: credentials
      assert_response 422
    end
    it 'I should not create a session with an invalid email' do
      credentials = { email: 'email@wrong.com', password: 'changeme' }
      post '/v1/sessions', session: credentials
      assert_response 422
    end
  end

  describe 'DESTROY /v1/sessions' do
    before(:each) do
      @user = FactoryGirl.create :user
      credentials = { email: @user.email, password: 'changeme' }
      post '/v1/sessions', session: credentials
      @auth_token = json_response[:auth_token]
    end
    it 'should destroy the users session' do
      delete "/v1/sessions/#{@auth_token}", nil, authorization: @auth_token
      assert_response :success
    end
    it 'should not have the old authorization token' do
      delete "/v1/sessions/#{@auth_token}", nil, authorization: @auth_token
      expect(@user.reload.auth_token).not_to eq @auth_token
    end
  end
end
