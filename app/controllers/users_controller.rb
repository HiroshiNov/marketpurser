class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録が完了しました。"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザ登録に失敗しました。"
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to edit_user_path(@user)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] ="退会しました。"
    redirect_to root_url
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end


end
