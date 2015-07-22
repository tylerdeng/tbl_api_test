require 'rails_helper'

describe 'Submission' do
  it 'routes get /v1/submissions to the submissions controller index' do
    expect(get('/v1/submissions')).to route_to('v1/submissions#index', format: 'json')
  end

  it 'routes post /v1/submissions to the submissions controller create' do
    expect(post('/v1/submissions')).to route_to('v1/submissions#create', format: 'json')
  end

  it 'routes put /v1/submissions/1234 to the submissions controller update' do
    expect(put('/v1/submissions/1234')).to route_to('v1/submissions#update', format: 'json', id: '1234')
  end

  it 'routes delete /v1/submissions/1234 to the submissions controller delete' do
    expect(delete('/v1/submissions/1234')).to route_to('v1/submissions#destroy', format: 'json', id: '1234')
  end

  it 'routes get /v1/submissions/1234 to the submissions controller show' do
    expect(get('/v1/submissions/1234')).to route_to('v1/submissions#show', format: 'json', id: '1234')
  end
end
