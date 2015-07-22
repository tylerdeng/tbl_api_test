require 'rails_helper'

describe 'list ', type: :feature do
  before(:each) do
    user = FactoryGirl.create(:admin)
    login_as(user, scope: :admin)
    visit rails_admin.index_path(model_name: 'organization')
  end
  it 'should have column Contact Name' do
    expect(page).to have_content 'Contact Name'
  end
  it 'should have column Business Name' do
    expect(page).to have_content 'Business Name'
  end
  it 'should have column Type' do
    expect(page).to have_content 'Type'
  end
  it 'should have column City' do
    expect(page).to have_content 'City'
  end
  it 'should have column State' do
    expect(page).to have_content 'State'
  end
  it 'should have column Expiration Date' do
    expect(page).to have_content 'Expiration Date'
  end
  it 'should have column Last Active' do
    expect(page).to have_content 'Last Active'
  end
end

describe 'edit', type: :feature do
  before(:each) do
    user = FactoryGirl.create(:admin)
    login_as(user, scope: :admin)
    @organization = FactoryGirl.create :organization
    visit rails_admin.edit_path(model_name: 'organization', id: @organization.id)
    @length = (1980..Time.now.year).count
  end
  it 'show id fields' do
    expect(page).to have_content 'Id'
  end
  it 'shows type fields' do
    expect(page).to have_content 'Type'
  end
  it 'shows name fields' do
    expect(page).to have_content 'Name'
  end
  it 'shows blog fields' do
    expect(page).to have_content 'Blog'
  end
  it 'shows Web address fields' do
    expect(page).to have_content 'Website'
  end
  it 'shows established_when fields' do
    expect(page).to have_content 'Year Established'
  end
  it 'show Email Address fields' do
    expect(page).to have_content 'Email Address'
  end
  it 'show First Name fields' do
    expect(page).to have_content 'First Name'
  end
  it 'show Last Name fields' do
    expect(page).to have_content 'Last Name'
  end
  it 'show id fields read only' do
    expect(page).to have_css '#organization_id_field .form-control-static'
  end
  it 'show type fields read only' do
    expect(page).to have_css '#organization_type_field .form-control-static'
  end
  it 'show established_when fields in selector' do
    expect(page).to have_css '#organization_established_when option', count: @length + 2
  end
  it 'show established_when fields in selector include Pre-1980' do
    expect(find("#organization_established_when option[#{@length + 2}]").text).to eq 'Pre-1980'
  end
  it 'show established_when fields in selector include 1980' do
    expect(find("#organization_established_when option[#{@length + 1}]").text).to eq '1980'
  end
  it 'show established_when fields in selector include current year' do
    expect(find('#organization_established_when option[2]').text).to eq Time.now.year.to_s
  end
end
