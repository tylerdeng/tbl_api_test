require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id
    end

    it 'returns the information about a user email a hash' do
      expect(json_response[:email]).to eql @user.email
    end

    it 'returns the information about created at in a hash ' do
      expect(json_response[:created_at]).to eq @user.created_at.iso8601(3)
    end
    it 'returns the information about updated at in a hash ' do
      expect(json_response[:updated_at]).to eq @user.updated_at.iso8601(3)
    end
    it 'returns the information about name in a hash ' do
      expect(json_response[:name]).to eq @user.name
    end
    it 'returns the information about type in a hash ' do
      expect(json_response[:type]).to eq @user.type
    end
    it 'returns the information about first name in a hash ' do
      expect(json_response[:first_name]).to eq @user.first_name
    end
    it 'returns the information about last name in a hash ' do
      expect(json_response[:last_name]).to eq @user.last_name
    end
    it 'returns the information about organization id in a hash ' do
      expect(json_response[:organization_id]).to eq @user.organization_id
    end
    it 'returns the information about auth. token at in a hash ' do
      expect(json_response[:auth_token]).to eq @user.auth_token
    end
    it { should respond_with 200 }
  end

  describe 'POST #create' do
    context 'when is successfully created' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, user: @user_attributes
      end
      it 'renders the json representation for the user record just created' do
        expect(json_response[:email]).to eq @user_attributes[:email]
      end
      it { should respond_with 201 }
    end

    context 'when is not created' do
      before(:each) do
        @invalid_user_attributes = { password: '12345678',
                                     password_confirmation: '12345678' }
        post :create, user: @invalid_user_attributes
      end
      it 'renders an errors json' do
        expect(json_response).to have_key(:errors)
      end

      it 'renders the json errors on why the user could not be created' do
        expect(json_response[:errors][:email]).to include "can't be blank"
      end
    end

    context 'when is not created' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        @invalid_user_attributes = @user_attributes
      end
      it 'renders an errors json' do
        @invalid_user_attributes[:first_name] = ''
        post :create, user: @invalid_user_attributes
        expect(json_response[:errors][:first_name]).to include "can't be blank"
      end
      it 'renders an errors json' do
        @invalid_user_attributes[:last_name] = ''
        post :create, user: @invalid_user_attributes
        expect(json_response[:errors][:last_name]).to include "can't be blank"
      end
      it 'renders the json errors' do
        @invalid_user_attributes[:email] = 'schen@xo'
        post :create, user: @invalid_user_attributes
        expect(json_response[:errors][:email]).to include 'is invalid'
      end
      it 'should not create an user without an unique uuid' do
        post :create, user: @user_attributes
        post :create, user: @user_attributes
        expect(json_response[:errors][:uuid]).to include 'has already been taken'
      end
    end
  end

  describe 'PUT/PATCH #update' do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
    end
    context 'when is successfully updated' do
      before(:each) do
        patch :update, id: @user.id,
                       user: { email: 'newmail@example.com' }
      end
      it 'renders the json representation for the updated user' do
        expect(json_response[:email]).to eq 'newmail@example.com'
      end
      it { should respond_with 200 }
    end
    context 'when is not updated' do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, id: @user.id,
                       user: { email: 'bademail.com' }
      end
      it 'renders an errors json' do
        expect(json_response).to have_key(:errors)
      end
      it 'renders the json errors on why the user could not be created' do
        expect(json_response[:errors][:email]).to include 'is invalid'
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      delete :destroy, id: @user.id
    end

    it { should respond_with 204 }
  end
end
