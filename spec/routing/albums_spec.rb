require 'rails_helper'

describe 'Albums' do
  it 'routes get /v1/albums to the albums controller index' do
    expect(get('/v1/albums')).to route_to('v1/albums#index', format: 'json', page: 1)
  end

  it 'routes post /v1/albums to the albums controller create' do
    expect(post('/v1/albums')).to route_to('v1/albums#create', format: 'json', page: 1)
  end

  it 'routes put /v1/albums/1234 to the albums controller update' do
    expect(put('/v1/albums/1234')).to route_to('v1/albums#update', format: 'json', id: '1234', page: 1)
  end

  it 'routes delete /v1/albums/1234 to the albums controller delete' do
    expect(delete('/v1/albums/1234')).to route_to('v1/albums#destroy', format: 'json', id: '1234', page: 1)
  end

  it 'routes get /v1/albums/1234 to the albums controller show' do
    expect(get('/v1/albums/1234')).to route_to('v1/albums#show', format: 'json', id: '1234', page: 1)
  end

  it 'routes get /v1/albums should have a default page equal to 1' do
    expect(get('/v1/albums/1234')).to route_to('v1/albums#show', format: 'json', id: '1234', page: 1)
  end
end
