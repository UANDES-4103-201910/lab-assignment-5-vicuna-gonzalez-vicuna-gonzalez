class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params)
  end

  def update
    respond_to do |format|
      if @user.update(params)
        render json: @user
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    render json: @users
  end
end
