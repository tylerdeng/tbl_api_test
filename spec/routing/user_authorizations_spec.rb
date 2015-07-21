require 'rails_helper'

describe 'UserAuthorizations' do
  it 'routes post /v1/user_authorizations to the user_authorizations controller create' do
    expect(post('/v1/user_authorizations')).to route_to('v1/user_authorizations#create', format: 'json')
  end

  it 'routes delete /v1/user_authorizations/dropbox to the user_authorizations controller destroy' do
    expect(delete('/v1/user_authorizations/dropbox')).to route_to('v1/user_authorizations#destroy', format: 'json', type: 'dropbox')
  end

  it 'routes get /v1/user_authorizations/dropbox to the user_authorizations controller find_user_authorization_by_type' do
    expect(get('/v1/user_authorizations/dropbox')).to route_to('v1/user_authorizations#find_user_authorization_by_type', format: 'json', type: 'dropbox')
  end

  it 'routes get /v1/user_authorizations to the user_authorizations controller find_all_authorizations' do
    expect(get('/v1/user_authorizations')).to route_to('v1/user_authorizations#find_all_authorizations', format: 'json')
  end
end
