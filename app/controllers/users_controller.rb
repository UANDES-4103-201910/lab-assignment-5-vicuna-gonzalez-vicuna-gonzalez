class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  protect_from_forgery
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
    @user = User.new(user_params)
    @user.save
    render json: @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
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

  def user_with_most_tickets
    max = 0
    @muser = null
    User.all.each do |user|
      i = 0
      tickets = Ticket.where(user_id: user.id)
      tickets.each do
        i += 1
      end
      if i>max
        @muser = user
        max = i
      end
    end
    render json: @muser
  end

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.permit(:name, :email, :password, :last_name, :address)
  end
end
