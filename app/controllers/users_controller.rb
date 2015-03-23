class UsersController < ApplicationController
  respond_to :json

  def index
    sleep 3
    @users = User.all
    respond_to do |format|
      format.json { render json: @users, layout: false }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user, layout: false }
    end
  end
end
