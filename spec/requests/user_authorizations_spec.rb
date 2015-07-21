require 'rails_helper'

RSpec.describe 'UserAuthorizations', type: :request do
  describe 'POST /v1/user_authorizations' do
    before(:each) do
      @user, @auth_token = sign_in_user
      @user_authorization_attributes = FactoryGirl.attributes_for :user_authorization, user_id: @user.id
    end
    it 'should create a new user_authorizations' do
      post '/v1/user_authorizations', { user_authorization: @user_authorization_attributes }, authorization: @auth_token
      assert_response :success
    end
    it 'should not create an user_authorization if missing a token' do
      @invalid_user_authorization_attributes = { type: 'dropbox', user_id: @user.id }
      post '/v1/user_authorizations', { user_authorization: @invalid_user_authorization_attributes }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:token]).to include "can't be blank"
    end
    it 'should not create an user_authorization if missing a type' do
      @invalid_user_authorization_attributes = { user_id: @user.id, token: '11' }
      post '/v1/user_authorizations', { user_authorization: @invalid_user_authorization_attributes }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:type]).to include "can't be blank"
    end
    it 'should not create an user_authorization if missing a user_id' do
      @invalid_user_authorization_attributes = { type: 'dropbox', token: '11' }
      post '/v1/user_authorizations', { user_authorization: @invalid_user_authorization_attributes }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:user_id]).to include "can't be blank"
    end
    it 'should not create an user_authorization with the same type name per user_id' do
      post '/v1/user_authorizations', { user_authorization: @user_authorization_attributes }, authorization: @auth_token
      post '/v1/user_authorizations', { user_authorization: @user_authorization_attributes }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:type]).to include 'has already been taken'
    end
    it 'should not create an user_authorization if missing a authorization token' do
      post '/v1/user_authorizations', user_authorization: @user_authorization_attributes
      assert_response 401
    end
  end

  describe 'DELETE /v1/user_authorizations' do
    before(:each) do
      @user, @auth_token = sign_in_user
      @user_authorization = FactoryGirl.create :user_authorization, user_id: @user.id
    end

    it 'should delete user_authorization ' do
      delete "/v1/user_authorizations/#{@user_authorization.type}", nil, authorization: @auth_token
      assert_response :success
      expect(response.status).to eq(204)
    end
    it 'should not delete user_authorization with invalid_auth_token' do
      delete "/v1/user_authorizations/#{@user_authorization.type}", nil, authorization: 'invalid_auth_token'
      expect(response.status).to eq(401)
      expect(json_response[:errors]).to include 'Not authenticated'
    end
  end

  describe 'GET /v1/user_authorizations' do
    before(:each) do
      @user, @auth_token = sign_in_user
      @user_authorization = FactoryGirl.create :user_authorization, user_id: @user.id
    end
    it 'should return success' do
      get "/v1/user_authorizations/#{@user_authorization.type}", nil, authorization: @auth_token
      assert_response :success
      assert_equal ({
        'id' => @user_authorization.id,
        'type' => @user_authorization.type,
        'token' => @user_authorization.token,
        'secret' => @user_authorization.secret,
        'user_id' => @user_authorization.user_id
      }), JSON.parse(response.body)
    end
    it 'should not get an user_authorization if missing an authorization token' do
      get "/v1/user_authorizations/#{@user_authorization.type}"
      assert_response 401
      expect(json_response[:errors]).to include 'Not authenticated'
    end
    it 'should not get an user_authorization if service not found' do
      get '/v1/user_authorizations/smugmug', nil, authorization: @auth_token
      assert_response 404
      expect(json_response[:errors]).to include 'User authorization was not found'
    end
  end
  describe 'GET /v1/user_authorizations' do
    before(:each) do
      @user, @auth_token = sign_in_user
    end
    it 'should return an array of all user_authorizations with a valid_auth_token' do
      @user_authorization = FactoryGirl.create :user_authorization, user_id: @user.id
      @user_authorization1 = FactoryGirl.create :user_authorization, user_id: @user.id, type: 'smugmug'
      get '/v1/user_authorizations', nil, authorization: @auth_token
      assert_response :success
      assert_equal JSON.parse(response.body).size, 2
      assert_equal ({
        'id' => @user_authorization.id,
        'type' => @user_authorization.type,
        'token' => @user_authorization.token,
        'secret' => @user_authorization.secret,
        'user_id' => @user_authorization.user_id
      }), JSON.parse(response.body)[0]
      assert_equal ({
        'id' => @user_authorization1.id,
        'type' => @user_authorization1.type,
        'token' => @user_authorization1.token,
        'secret' => @user_authorization1.secret,
        'user_id' => @user_authorization1.user_id
      }), JSON.parse(response.body)[1]
    end
    it 'should not get any user_authorization with an invalid_auth_token' do
      get '/v1/user_authorizations', nil, authorization: 'invalid_auth_token'
      assert_response 401
      expect(json_response[:errors]).to include 'Not authenticated'
    end
    it 'should return an empty array if there are no records' do
      get '/v1/user_authorizations', nil, authorization: @auth_token
      assert_response :success
      assert_equal JSON.parse(response.body).size, 0
    end
  end
end
