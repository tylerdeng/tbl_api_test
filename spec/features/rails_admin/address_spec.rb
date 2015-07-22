require 'rails_helper'

describe 'edit', type: :feature do
  before(:each) do
    user = FactoryGirl.create(:admin)
    login_as(user, scope: :admin)
    @address = FactoryGirl.create :address
    visit rails_admin.edit_path(model_name: 'address', id: @address.id)
  end
  it 'show Type fields' do
    expect(page).to have_content 'Type'
  end
  it 'show Phone fields' do
    expect(page).to have_content 'Phone'
  end
  it 'show Address Line1  fields' do
    expect(page).to have_content 'Address Line1'
  end
  it 'show Address line2 fields' do
    expect(page).to have_content 'Address line2'
  end
  it 'show City fields' do
    expect(page).to have_content 'Type'
  end
  it 'show Zip Code / Postal Code fields' do
    expect(page).to have_content 'Zip Code / Postal Code'
  end
  it 'show State / Province fields' do
    expect(page).to have_content 'State / Province'
  end
  it 'show Country line2 fields' do
    expect(page).to have_content 'Country'
  end
end
