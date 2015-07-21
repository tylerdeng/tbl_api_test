require 'rails_helper'

RSpec.describe V1::MediaController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      @media = FactoryGirl.attributes_for :media
    end

    context 'when is successfully created' do
      before(:each) do
        post :create, media: @media
      end
      it 'should return 200 with valid_media_params' do
        expect(response.status).to eq(200)
      end
      it 'should render a success message json' do
        expect(json_response[:message]).to include 'success'
      end
    end
    context 'when is not created' do
      it 'should render an errors json if missing type' do
        @media[:type] = ''
        post :create, media: @media
        expect(json_response[:errors][:type]).to include "can't be blank"
      end
      it 'should render an errors json if missing file_name' do
        @media[:file_name] = ''
        post :create, media: @media
        expect(json_response[:errors][:file_name]).to include "can't be blank"
      end
      it 'should render an errors json if missing file_type' do
        @media[:file_type] = ''
        post :create, media: @media
        expect(json_response[:errors][:file_type]).to include "can't be blank"
      end
      it 'should render an errors json if missing url' do
        @media[:url] = ''
        post :create, media: @media
        expect(json_response[:errors][:url]).to include "can't be blank"
      end
      it 'should render an errors json if missing legal_release_info' do
        @media[:legal_release_info] = ''
        post :create, media: @media
        expect(json_response[:errors][:legal_release_info]).to include "can't be blank"
      end
      it 'should render an errors json if missing size' do
        @media[:size] = ''
        post :create, media: @media
        expect(json_response[:errors][:size]).to include "can't be blank"
      end
      it 'should render an errors json if missing width' do
        @media[:width] = ''
        post :create, media: @media
        expect(json_response[:errors][:width]).to include "can't be blank"
      end
      it 'should render an errors json if missing height' do
        @media[:height] = ''
        post :create, media: @media
        expect(json_response[:errors][:height]).to include "can't be blank"
      end
      it 'should render an errors json if missing s3_bucket_id' do
        @media[:s3_bucket_id] = ''
        post :create, media: @media
        expect(json_response[:errors][:s3_bucket_id]).to include "can't be blank"
      end
      it 'should render an errors json if missing xo_media_id' do
        @media[:xo_media_id] = ''
        post :create, media: @media
        expect(json_response[:errors][:xo_media_id]).to include "can't be blank"
      end
      it 'should render an errors json if uuid exist' do
        post :create, media: @media
        post :create, media: @media
        expect(json_response[:errors][:uuid]).to include 'has already been taken'
      end
    end
  end
end
