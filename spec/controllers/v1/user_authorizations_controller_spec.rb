require 'rails_helper'

RSpec.describe V1::UserAuthorizationsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create :user
    @valid_auth_token = @user.auth_token
    @invalid_auth_token = 'invalid_auth_token'
    @user_authorization = FactoryGirl.create :user_authorization, user_id: @user.id
    @valid_authorization_type = @user_authorization.type
    @invalid_authorization_type = 'invalid_authorization_type'
  end
  describe 'POST #create' do
    context 'when is successfully created' do
      before(:each) do
        api_authorization_header @valid_auth_token
        @user_authorization_attributes = FactoryGirl.attributes_for :user_authorization
        post :create, user_authorization: @user_authorization_attributes
      end
      it 'renders an success msg json just created' do
        expect(json_response[:msg]).to eq 'success'
      end
      it { should respond_with 200 }
    end

    context 'when is not created' do
      before(:each) do
        @invalid_user_authorization_attributes = {
          user_id: '',
          type: 'third_party',
          token: ''
        }
        api_authorization_header @valid_auth_token
        post :create, user_authorization: @invalid_user_authorization_attributes
      end
      it 'renders an errors json' do
        expect(json_response).to have_key(:errors)
      end
      it 'renders the json errors on why the user could not be created' do
        expect(json_response[:errors][:token]).to include "can't be blank"
      end
      it 'renders the json errors on why the user could not be created' do
        expect(json_response[:errors][:type]).to include 'is not included in the list'
      end
    end
  end

  describe 'delete #destroy' do
    context 'when is successfully delete ' do
      before(:each) do
        api_authorization_header @valid_auth_token
        delete :destroy, type: @valid_authorization_type
      end
      it 'should return the information about msg in a hash' do
        expect(json_response[:msg]).to include 'success'
      end
      it { should respond_with 204 }
    end
    context 'when fails to delete ' do
      before(:each) do
        api_authorization_header @invalid_auth_token
        delete :destroy, type: @valid_authorization_type
      end
      it 'should return the information about errors in a hash' do
        expect(json_response[:errors]).to include 'Not authenticated'
      end
      it { should respond_with 401 }
    end
  end

  describe 'GET #find_user_authorization_by_type' do
    context 'when is successfully get ' do
      before(:each) do
        api_authorization_header @valid_auth_token
        get :find_user_authorization_by_type, type: @valid_authorization_type
      end

      it 'should return the information about a user_authorization id a hash' do
        expect(json_response[:id]).to eql @user_authorization.id
      end
      it 'should return the information about type in a hash ' do
        expect(json_response[:type]).to eq @user_authorization.type
      end
      it 'should return the information about token in a hash ' do
        expect(json_response[:token]).to eq @user_authorization.token
      end
      it 'should return the information about user_id in a hash ' do
        expect(json_response[:user_id]).to eq @user_authorization.user_id
      end
      it 'should return the information about secret in a hash ' do
        expect(json_response[:secret]).to eq @user_authorization.secret
      end

      it { should respond_with 200 }
    end
    context 'when fails to get with valid_auth_token and invalid_authorization_type' do
      before(:each) do
        api_authorization_header @valid_auth_token
        get :find_user_authorization_by_type, type: @invalid_authorization_type
      end
      it 'should return 404 ' do
        expect(response.status).to eq(404)
      end
      it 'should return the information about errors in a hash' do
        expect(json_response[:errors]).to include 'User authorization was not found'
      end
    end
    context 'when fails to get with invalid_auth_token and valid_authorization_type' do
      before(:each) do
        api_authorization_header @invalid_auth_token
        get :find_user_authorization_by_type, type: @valid_authorization_type
      end
      it 'should return 401' do
        expect(response.status).to eq(401)
      end
      it 'should return the information about errors in a hash' do
        expect(json_response[:errors]).to include 'Not authenticated'
      end
    end
  end

  describe 'GET #find_all_authorizations' do
    context 'when is successfully get' do
      before(:each) do
        api_authorization_header @valid_auth_token
        FactoryGirl.create :user_authorization, user_id: @user.id, type: 'smugmug'
        get :find_all_authorizations
      end
      it 'return an array with all user_authorizations' do
        expect(json_response.size).to eql 2
      end
      it { should respond_with 200 }
    end
    context 'when fails to get' do
      before(:each) do
        api_authorization_header @invalid_auth_token
        get :find_all_authorizations
      end
      it 'should return 401' do
        expect(response.status).to eq(401)
      end
      it 'should return the information about errors in a hash' do
        expect(json_response[:errors]).to include 'Not authenticated'
      end
    end
  end
end
