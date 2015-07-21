class V1::UserAuthorizationsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def create
    user_authorization = UserAuthorization.new(user_authorization_params)
    if user_authorization.save
      render json: { msg: 'success' }, status: 200
    else
      render json: { errors: user_authorization.errors }, status: 400
    end
  end

  def destroy
    UserAuthorization.where(user_id: @current_user.id).where(type: params[:type]).destroy_all
    render json: { msg: 'success' }, status: 204
  end

  def find_user_authorization_by_type
    user_authorization = UserAuthorization.find_by_user_id_and_type(@current_user.id, params[:type])
    if user_authorization
      render json: user_authorization.to_json(except: [:created_at, :updated_at]), status: 200
    else
      render json: { errors: 'User authorization was not found' }, status: 404
    end
  end

  def find_all_authorizations
    respond_with UserAuthorization.where(['user_id = ?', @current_user.id]).to_json(except: [:created_at, :updated_at])
  end

  private

  def user_authorization_params
    params.require(:user_authorization).permit(:token, :type, :user_id, :secret)
  end
end
