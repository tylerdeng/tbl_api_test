require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /v1/users' do
    it 'should return success' do
      @user = FactoryGirl.create :user

      get "/v1/users/#{@user.to_param}"
      assert_response :success
      assert_equal ({
        'id' => @user.id,
        'email' => @user.email,
        'created_at' => @user.created_at.iso8601(3),
        'updated_at' => @user.updated_at.iso8601(3),
        'name' => @user.name,
        'type' => @user.type,
        'title' => @user.title,
        'first_name' => @user.first_name,
        'last_name' => @user.last_name,
        'organization_id' => @user.organization_id,
        'uuid' => @user.uuid,
        'auth_token' => @user.auth_token
      }), JSON.parse(response.body)
    end
  end
  describe 'POST /v1/users' do
    before(:each) do
      @user_attributes = FactoryGirl.attributes_for :user
      @invalid_user_attributes = @user_attributes
    end
    it 'should create a new user' do
      post '/v1/users', user: @user_attributes
      assert_response :success
      expect(json_response[:email]).to eq @user_attributes[:email]
      expect(json_response[:type]).to eq @user_attributes[:type]
      expect(json_response[:uuid]).to eq @user_attributes[:uuid]
      expect(json_response[:auth_token]).not_to eq @user_attributes[:auth_token]
    end
    it 'should not create an user if missing an email' do
      @invalid_user_attributes = { password: '12345678',
                                   password_confirmation: '12345678' }
      post '/v1/users', user: @invalid_user_attributes
      assert_response 422
      expect(json_response[:errors][:email]).to include "can't be blank"
    end
    it 'should not create an user if password and  password confirmation does not match' do
      @invalid_user_attributes[:password_confirmation] = '12345678'
      post '/v1/users', user: @invalid_user_attributes
      assert_response 422
      expect(json_response[:errors][:password_confirmation]).to include "doesn't match Password"
    end
    it 'should not create an user without a first name' do
      @invalid_user_attributes[:first_name] = ''
      post '/v1/users', user: @invalid_user_attributes
      assert_response 422
      expect(json_response[:errors][:first_name]).to include "can't be blank"
    end
    it 'should not create an user without a last name' do
      @invalid_user_attributes[:last_name] = ''
      post '/v1/users', user: @invalid_user_attributes
      assert_response 422
      expect(json_response[:errors][:last_name]).to include "can't be blank"
    end
    it 'should not create an user without an invalid email' do
      @invalid_user_attributes[:email] = 'schen@xo'
      post '/v1/users', user: @invalid_user_attributes
      assert_response 422
      expect(json_response[:errors][:email]).to include 'is invalid'
    end
    it 'should not create an user without an unique uuid' do
      post '/v1/users', user: @user_attributes
      post '/v1/users', user: @user_attributes
      assert_response 422
      expect(json_response[:errors][:uuid]).to include 'has already been taken'
    end
  end
  describe 'DELETE /v1/users' do
    before(:each) do
      @user, @auth_token = sign_in_user
    end

    it 'should delete the requested user' do
      delete "/v1/users/#{@user.id}", nil, authorization: @auth_token
      assert_response 204
    end
  end
  describe 'PUT/PATCH /v1/users' do
    before(:each) do
      @user, @auth_token = sign_in_user
    end

    context 'when is successfully updated email' do
      before(:each) do
        patch "/v1/users/#{@user.id}",
              { user: { email: 'newmail@example.com' } },
              authorization: @auth_token
      end
      it 'renders the json representation for the updated user' do
        expect(json_response[:email]).to eq 'newmail@example.com'
        assert_response :success
      end
    end
    context 'when email is not valid is not updated' do
      before(:each) do
        patch "/v1/users/#{@user.id}",
              { user: { email: 'bademail.com' } },
              authorization: @auth_token
      end
      it 'renders an errors json' do
        assert_response 422
        expect(json_response[:errors][:email]).to include 'is invalid'
      end
    end
  end
end
