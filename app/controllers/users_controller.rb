class UsersController < ApplicationController
  # has_many :tasks

  before_action :set_user, only: [:show, :destroy]
  skip_before_action :authenticate_request, only: [:create, :index]

  def index
    # @user = User.new
    @users = User.all.order(created_at: :desc)
    render json: @users
  end

  # def new
  #     @user = User.new
  #   end

  def create
    @user = User.new # @user = User.create(users_params)
    @user.login = params[:login]
    @user.password = params[:password]
    # @user.password_confirmation =  params[:password]
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: 'ok'
    #  render :json, status: :ok
  end

  # def update
  #     @user = User.find(params[:id])
  #    @user.update(users_params)
  # end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:login, :password)
  end
end
