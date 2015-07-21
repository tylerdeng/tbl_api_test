require 'rails_helper'

RSpec.describe V1::AlbumsController, type: :controller do
  render_views

  describe 'GET /v1/albums' do
    let!(:albums) { FactoryGirl.create_list(:album, 3) }
    before do
      albums.each do |album|
        @subjects = FactoryGirl.build_list(:subject, 2)
        @subjects.each do |subject|
          subject.album = album
          subject.save
        end
        @media = FactoryGirl.build_list(:media, 5)
        @media.each do |media|
          media.album = album
          media.save
        end
        @event = FactoryGirl.build(:event)
        @event.album = album
        @event.save
      end

      get :index, format: :json
    end

    context 'all albums' do
      it 'returns the albums' do
        expect(json_response[:albums].collect { |l| l[:story] }).to include(albums.first.story)
      end
    end

    context 'subjects within the albums' do
      it 'should return all subjects associated with an album' do
        json_response[:albums].each do |album|
          expect(album[:subjects].collect { |l| l[:name] }.count).to eq 2
        end
      end
    end

    context 'media items within albums' do
      it 'should return all media items associated with an album' do
        json_response[:albums].each do |album|
          expect(album[:media].collect { |l| l[:url] }.count).to eq 5
        end
      end
    end

    context 'event' do
      it 'should return the associated album event' do
        json_response[:albums].each do |album|
          expect(album[:event][:type]).to eq @event.type
        end
      end
    end
  end

  describe 'Get /v1/albums?page=1&page_size=10' do
    let!(:albums) { FactoryGirl.create_list(:album, 100) }
    before do
      get :index, format: :json, page: 2, page_size: 10
    end
    it 'returns 10 albums' do
      expect(json_response[:albums].count).to eq 10
    end
    it 'return next page link' do
      expect(json_response[:next_page]).to eq 'http://test.host/v1/albums?page=3&page_size=10'
    end
    it 'return next page link' do
      expect(json_response[:previous_page]).to eq 'http://test.host/v1/albums?page=1&page_size=10'
    end
    it 'returns 10 pages' do
      expect(json_response[:total_pages]).to eq 10
    end
    it 'return total album count' do
      expect(json_response[:total]).to eq 100
    end
  end

  describe 'Get /v1/albums?organization=1' do
    context 'all albums for a given organization' do
      let!(:albums) { FactoryGirl.create_list(:album, 3) }
      let!(:organizations) { FactoryGirl.create_list(:organization, 3) }
      before do
        organization = organizations.first
        organization.albums << albums.take(2)
        organization.save
        @id = organization.id
        get :index, format: :json, organization_id: @id
      end
      it 'returns the albums' do
        organization = Organization.find(@id)
        json_response[:albums].each do |album|
          expect(album[:organizations].collect { |l| l[:name] }).to include(organization.name)
        end
      end
    end
  end

  describe 'Get /v1/albums?publication=1' do
    context 'all albums for a given publication' do
      let!(:albums) { FactoryGirl.create_list(:album, 3) }
      let!(:organizations) { FactoryGirl.create_list(:organization, 3) }
      let!(:publications) { FactoryGirl.create_list(:publication, 3) }
      before do
        organization = organizations.first
        publication = publications.first
        organization.publications << publication

        publication.albums << albums.take(2)
        publication.save
        organization.save

        @id = publication.id
        get :index, format: :json, publication_id: @id
      end
      it 'returns the albums' do
        publication = Publication.find(@id)
        json_response[:albums].each do |album|
          expect(album[:publications].collect { |l| l[:name] }).to include(publication.name)
        end
      end
    end
  end

  describe 'build_paging_url' do
    before(:each) do
      request = double('http:request', host: 'test.com', path: '/v1/path', port: 80)
      allow(controller).to receive(:request).and_return(request)
    end
    it 'should return nil if page is nil' do
      expect(controller.send(:build_paging_url, nil, 30)).to be_nil
    end
    it 'should return url should contain correct page' do
      uri = URI.parse(controller.send(:build_paging_url, 4, 30))
      expect(uri.query).to include('page=4')
    end
    it 'should return url should contain correct page' do
      uri = URI.parse(controller.send(:build_paging_url, 4, 30))
      expect(uri.query).to include('page_size=30')
    end
  end
end
