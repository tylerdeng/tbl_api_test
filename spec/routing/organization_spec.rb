require 'rails_helper'

describe 'Organization' do
  it 'routes get /v1/organizations to the organization controller index' do
    expect(get('/v1/organizations')).to route_to('v1/organizations#index', format: 'json')
  end

  it 'routes post /v1/organizations to the organization controller create' do
    expect(post('/v1/organizations')).to route_to('v1/organizations#create', format: 'json')
  end

  it 'routes put /v1/organizations/1234 to the organization controller update' do
    expect(put('/v1/organizations/1234')).to route_to('v1/organizations#update', format: 'json', id: '1234')
  end

  it 'routes delete /v1/organizations/1234 to the organization controller delete' do
    expect(delete('/v1/organizations/1234')).to route_to('v1/organizations#destroy', format: 'json', id: '1234')
  end

  it 'routes get /v1/organizations/1234 to the organization controller show' do
    expect(get('/v1/organizations/1234')).to route_to('v1/organizations#show', format: 'json', id: '1234')
  end
end
