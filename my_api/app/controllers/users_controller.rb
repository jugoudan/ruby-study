class UsersController < ApplicationController
  

  def my_create
    @user = User.new(user_params)
    if @user.save
      #render json: @user, status: :created, location: @user
      render json: @user
     else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  
  def my_delete
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  def my_update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  def my_retrieveall
    @users = User.all
    render json: @users
  end
  
  def my_retrieve
    if @user = User.find(params[:id])
    render json: @user
    else
    render json:
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :status)
    end
end
