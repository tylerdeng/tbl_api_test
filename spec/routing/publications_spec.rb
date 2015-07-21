require 'rails_helper'

describe 'Publications' do
  it 'routes get /v1/publications to the publications controller index' do
    expect(get('/v1/publications')).to route_to('v1/publications#index', format: 'json')
  end

  it 'routes post /v1/publications to the publications controller create' do
    expect(post('/v1/publications')).to route_to('v1/publications#create', format: 'json')
  end

  it 'routes put /v1/publications/1234 to the publications controller update' do
    expect(put('/v1/publications/1234')).to route_to('v1/publications#update', format: 'json', id: '1234')
  end

  it 'routes delete /v1/publications/1234 to the publications controller delete' do
    expect(delete('/v1/publications/1234')).to route_to('v1/publications#destroy', format: 'json', id: '1234')
  end

  it 'routes get /v1/publications/1234 to the publications controller show' do
    expect(get('/v1/publications/1234')).to route_to('v1/publications#show', format: 'json', id: '1234')
  end
end
