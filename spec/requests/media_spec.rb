require 'rails_helper'

RSpec.describe 'Media', type: :request do
  describe 'POST /v1/media' do
    before(:each) do
      @user, @auth_token = sign_in_user
      @media = FactoryGirl.attributes_for :media
    end
    it 'should create a new media' do
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response :success
    end
    it 'should not create a new media if missing type' do
      @media[:type] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:type]).to include "can't be blank"
    end
    it 'should not create a new media if missing file_name' do
      @media[:file_name] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:file_name]).to include "can't be blank"
    end
    it 'should not create a new media if missing file_type' do
      @media[:file_type] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:file_type]).to include "can't be blank"
    end
    it 'should not create a new media if missing url' do
      @media[:url] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:url]).to include "can't be blank"
    end
    it 'should not create a new media if missing legal_release_info' do
      @media[:legal_release_info] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:legal_release_info]).to include "can't be blank"
    end
    it 'should not create a new media if missing size' do
      @media[:size] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:size]).to include "can't be blank"
    end
    it 'should not create a new media if missing width' do
      @media[:width] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:width]).to include "can't be blank"
    end
    it 'should not create a new media if missing height' do
      @media[:height] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:height]).to include "can't be blank"
    end
    it 'should not create a new media if missing s3_bucket_id' do
      @media[:s3_bucket_id] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:s3_bucket_id]).to include "can't be blank"
    end
    it 'should not create a new media if missing xo_media_id' do
      @media[:xo_media_id] = ''
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:xo_media_id]).to include "can't be blank"
    end
    it 'should not create a new media if uuid exist' do
      post '/v1/media', { media: @media }, authorization: @auth_token
      post '/v1/media', { media: @media }, authorization: @auth_token
      assert_response 400
      expect(json_response[:errors][:uuid]).to include 'has already been taken'
    end
    it 'should not create a new media if missing a authorization token' do
      post '/v1/media', media: @media
      assert_response 401
    end
  end
end
