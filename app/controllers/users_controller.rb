class UsersController < ApplicationController
require 'net/https'
require 'uri'

  def show
    @user = User.find(params[:id])
    token = 'br48hbfrh5rcrh1r2a50'
    base_url = "https://finnhub.io/api/v1/stock/candle?symbol=AAPL&resolution=D&from=1510000000&to=1585000000&token=#{token}" 
 
    uri = URI.parse(base_url)
    @response = Net::HTTP.get_response(uri) 
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
      flash[:success] = 'Message は正常に更新されました'
      redirect_to edit_user_path(@user)
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end
  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end


end
