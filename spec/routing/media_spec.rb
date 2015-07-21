require 'rails_helper'

describe 'Media' do
  it 'routes get /v1/media to the media controller index' do
    expect(get('/v1/media')).to route_to('v1/media#index', format: 'json')
  end

  it 'routes post /v1/media to the media controller create' do
    expect(post('/v1/media')).to route_to('v1/media#create', format: 'json')
  end

  it 'routes put /v1/media/1234 to the media controller update' do
    expect(put('/v1/media/1234')).to route_to('v1/media#update', format: 'json', id: '1234')
  end

  it 'routes delete /v1/media/1234 to the media controller delete' do
    expect(delete('/v1/media/1234')).to route_to('v1/media#destroy', format: 'json', id: '1234')
  end

  it 'routes get /v1/media/1234 to the media controller show' do
    expect(get('/v1/media/1234')).to route_to('v1/media#show', format: 'json', id: '1234')
  end
end
