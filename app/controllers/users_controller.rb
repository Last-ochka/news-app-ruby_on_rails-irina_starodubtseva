class UsersController < ApplicationController

  # has_many :tasks 

  def index
    @user = User.new
    @users = User.all.order(created_at: :desc)
    render json: @users    
end
 
def create
   @user = User.new(users_params)
@user.save      
end

def show
    @user= User.find(params[:id])
    render json: @user
end

def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: 'ok'
    #  render :json, status: :ok
end

def update
    @user = User.find(params[:id])
   @user.update(users_params)  
end

private
    def users_params
        params.require(:user).permit(:login, :password)
    end
end
