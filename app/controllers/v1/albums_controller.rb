class V1::AlbumsController < ApplicationController
  def index
    if (organization_id = params[:organization_id])
      @albums = query(:organization_albums, { organization_albums: { organization_id: organization_id } }, params[:page], params[:page_size])
    elsif (publication_id = params[:publication_id])
      @albums = query(:published_albums, { published_albums: { publication_id: publication_id } }, params[:page], params[:page_size])
    else
      @albums = query('', '', params[:page], params[:page_size])
    end

    build_urls

    respond_to do |format|
      format.json
    end
  end

  private

  def query(join, where, page, page_size)
    @albums = Album.includes(:organizations, :publications, :subjects, :media, :event)
    @albums = @albums.joins(join) if join != ''
    @albums = @albums.where(where) if where != ''
    @albums = @albums.paginate(page: page, per_page: page_size)
  end

  def build_urls
    @total_pages = @albums.try(:total_pages) || 1
    @total_entries = @albums.try(:total_entries) || @albums.count
    @next_page = build_paging_url @albums.try(:next_page), @albums.try(:per_page)
    @previous_page = build_paging_url @albums.try(:previous_page), @albums.try(:per_page)
  end

  def build_paging_url(page, page_size)
    return unless page
    query = {}
    query['page'] = page
    query['page_size'] = page_size
    query.compact!

    uri = URI::HTTP.build(host: request.host,
                          port: request.port,
                          query: query.to_query,
                          path: request.path)
    uri.to_s
  end
end
