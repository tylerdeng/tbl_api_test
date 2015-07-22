class V1::MediaController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  def create
    @media_data = Media.create(media_params)
    if @media_data.save
      render json: { message: 'success' }, status: 200
    else
      render json: { errors: @media_data.errors }, status: 400
    end
  end

  private

  def media_params
    params.require(:media).permit!.except(:id)
  end
end
