require 'rails_helper'

describe 'Users' do
  it 'routes get /v1/users/1234 to the user controller show' do
    expect(get('/v1/users/1234')).to route_to('v1/users#show', format: 'json', id: '1234')
  end

  it 'routes post /v1/users to the users controller create' do
    expect(post('/v1/users')).to route_to('v1/users#create', format: 'json')
  end

  it 'routes put /v1/users/1234 to the users controller update' do
    expect(put('/v1/users/1234')).to route_to('v1/users#update', format: 'json', id: '1234')
  end

  it 'routes delete /v1/users/1234 to the users controller delete' do
    expect(delete('/v1/users/1234')).to route_to('v1/users#destroy', format: 'json', id: '1234')
  end
end
