class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:show,:edit]
  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Registration completed successfully."
      redirect_to @user
    else
      flash.now[:danger] = "Registration falled."
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'Your infomation has successfully updated'
      redirect_to edit_user_path(@user)
    else
      flash.now[:danger] = 'Your infomation has failed to update'
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] ="Your account successfully deleted."
    redirect_to root_url
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
