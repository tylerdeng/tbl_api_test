require 'rails_helper'

describe 'Sessions' do
  it 'routes post /v1/sessions to the sessions controller create' do
    expect(post('/v1/sessions')).to route_to('v1/sessions#create', format: 'json')
  end
  it 'routes delete /v1/sessions/1234 to the sessions controller delete' do
    expect(delete('/v1/sessions/1234')).to route_to('v1/sessions#destroy', format: 'json', id: '1234')
  end
end
